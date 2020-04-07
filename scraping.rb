require 'selenium-webdriver'
require 'date'
require 'dotenv/load'
require 'google_drive'

driver = Selenium::WebDriver.for :remote, desired_capabilities: :chrome, url: "http://#{ENV['SELENIUM_HOST']}:4444/wd/hub"

def driver.find_and_wait_element(how, what)
  Selenium::WebDriver::Wait.new(timeout: 10).until{ find_element(how, what) }
  sleep 2 # コンテンツがヌルっと出てくるのでちょっと待たないとクリック等ができない
  find_element(how, what)
end

###

# ログイン
driver.navigate.to('https://www.pref.miyazaki.lg.jp/kenko/hoken/kansensho/covid19/hassei.html') #(ENV['URL'])
data = driver.page_source
puts 'こんにちは'
puts '今日の天気は'
list_table = driver.find_element(:class => "list_table")
dates = list_table.find_elements(:class => "date")
url = list_table.find_element(:tag_name => "a").attribute("href")
texts = list_table.find_elements(:tag_name => "a")
puts dates
count = dates.length
for i in 1..count do
  p i
  p dates[i]
end
puts url
puts texts

# JSON出力
File.open("sample2.json", 'w') do |file|
  hash = { "Ocean" => { "Squid" => 10, "Octopus" =>8 }}
  str = JSON.dump(hash, file)
end

driver.find_and_wait_element(:id, 'login')
driver.find_element(:id, 'loginId').send_keys(ENV['LOGINID'])
driver.find_element(:id, 'passWord').send_keys(ENV['PASSWORD'])
driver.find_element(:xpath, '//*[@id="login"]/a').click

# 電力使用量ページへ
driver.find_and_wait_element(:xpath, '//*[@id="auto"]/section/div/div[2]/nav/ul/li[2]/p/a').click
driver.find_and_wait_element(:id, 'submitReferenceCrrspndDetailsPrtl').click

# 日付を指定
yesterday = Date.today - 1
date_field = driver.find_and_wait_element(:id, 'EntryInputForm_entryModel_svcStrtDt')
date_field.clear
date_field.send_keys(yesterday.strftime("%Y/%m/%d"))

# 表示形式を指定
time_indication_type = Selenium::WebDriver::Support::Select.new(driver.find_and_wait_element(:id, 'timeIndicationType'))
time_indication_type.select_by(:value, '1') # 24 時間表示

# 使用量データを抽出
data = driver.page_source.scan(/source\.data\.push\(\"(\d\.\d{2})\"\)/).flatten.map(&:to_f)

# Google SpreadSheet へ `data` を出力
session = GoogleDrive::Session.from_config('config.json')
ws = session.spreadsheet_by_key(ENV['SPREADSHEET_KEY']).worksheets[0]
48.times do |n|
  datetime = DateTime.parse(yesterday.to_s) + Rational(0.5 * n, 24) # 30 分刻み
  new_row = ws.num_rows + 1
  ws[new_row, 1] = datetime.strftime("%Y/%m/%d %H:%M:%S")
  ws[new_row, 2] = data[n]
end
ws.save
