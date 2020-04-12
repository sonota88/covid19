require 'selenium-webdriver'
# require 'date'

today = Date.today.strftime("%Y/%m/%d")
driver = Selenium::WebDriver.for :remote, desired_capabilities: :chrome, url: "http://#{ENV['SELENIUM_HOST']}:4444/wd/hub"

# スクレイピング
driver.navigate.to(ENV['URL'])
list_table = driver.find_element(:class => "list_table")
urls = list_table.find_elements(:tag_name => "a")
# texts = list_table.find_elements(:tag_name => "a")
# count = urls.length - 1
url = urls[0].attribute("href")
puts "news url = "
puts url

driver.navigate.to("https://www.pref.miyazaki.lg.jp/kohosenryaku/kenko/hoken/covid19_20200408.html")
# noicon
uls = driver.find_elements(:class => "noicon")
count = uls.length - 1
datas = []
for i in 0..count do
  puts "---"
  data = { "リリース日" => today, "退院" => "入院中", "date" => today }
  ul = uls[i]
  # puts ul.text

  address = ul.text.match(/（1）居住地(.+)/)
  if address
    data["居住地"] = address[1]
  else
    next
  end

  age = ul.text.match(/年齢(.+)/)
  if age
    data["年代"] = age[1]
  else
    next
  end

  gender = ul.text.match(/（3）性別(.+)/)
  if gender
    data["性別"] = gender[1]
  else
    next
  end

  p data
  datas.push(data)
end
p datas
# datas の数を数える

exit

