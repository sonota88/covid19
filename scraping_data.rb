require 'selenium-webdriver'
# require 'date'

today = Date.today.strftime("%Y/%m/%d")
driver = Selenium::WebDriver.for :remote, desired_capabilities: :chrome, url: "http://#{ENV['SELENIUM_HOST']}:4444/wd/hub"

# 最新ニュースのURL取得
driver.navigate.to(ENV['URL'])
list_table = driver.find_element(:class => "list_table")
urls = list_table.find_elements(:tag_name => "a")
# texts = list_table.find_elements(:tag_name => "a")
# count = urls.length - 1
url = urls[0].attribute("href")
puts "news url = "
puts url

# 最新ニュースをスクレイピング
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

  address = ul.text.match(/居住地(.+)/)
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

  gender = ul.text.match(/性別(.+)/)
  if gender
    data["性別"] = gender[1]
  else
    next
  end

  p data
  datas.push(data)
end
p datas
data_count = datas.length

data_hash = {}
File.open("data/data.json") do |file|
  data_hash = JSON.load(file)
  p data_hash
end

# data.json を更新
data_hash["lastUpdate"] = today
data_hash["patients"]["date"] = today
data_hash["patients"]["data"].push(datas)
data_hash["main_summary"]["children"][0]["value"] = data_hash["main_summary"]["children"][0]["value"] + data_count
data_hash["main_summary"]["children"][0]["children"][0]["value"] = data_hash["main_summary"]["children"][0]["children"][0]["value"] + data_count
data_hash["main_summary"]["children"][0]["children"][0]["children"][0]["value"] = data_hash["main_summary"]["children"][0]["children"][0]["children"][0]["value"] + data_count
# data = 
data_hash["contacts"]["data"].push({ "日付" => today, "小計" => data_count })

data_json = JSON.pretty_generate(data_hash)
File.open("data/data.json", mode = "w") { |f|
  f.write(data_json)
}

exit