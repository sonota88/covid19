require 'selenium-webdriver'

driver = Selenium::WebDriver.for :remote, desired_capabilities: :chrome, url: "http://#{ENV['SELENIUM_HOST']}:4444/wd/hub"

# スクレイピング
driver.navigate.to(ENV['URL'])
if (driver.find_elements(:class => "info_list").size == 0)
  puts "no info_list"
  exit
end
infoList = driver.find_element(:class => "info_list")
scrapedNews = infoList.find_elements(:tag_name => "a")
count = scrapedNews.length - 1
newsItems = []
for i in 0..count do
  newsItem = { "url" => scrapedNews[i].attribute("href"), "text" => scrapedNews[i].text }
  newsItems.push(newsItem)
end
news = { "newsItems" => newsItems }
puts news

# JSON出力
newsJson = JSON.pretty_generate(news, {:indent => "    "})
File.open("data/news.json", mode = "w") { |f|
  f.write(newsJson)
}

pcrTable = driver.find_elements(:class => "datatable").last
rows = pcrTable.find_elements(:tag_name => "tr").last
total = rows.find_element(:tag_name => "td").find_element(:tag_name => "p")

dataHash = {}
File.open("data/data.json") do |file|
  dataHash = JSON.load(file)
end

dataHash["main_summary"]["value"] = total.text.delete(",").to_i

dataJson = JSON.pretty_generate(dataHash, {:indent => "    "})
File.open("data/data.json", mode = "w") { |f|
  f.write(dataJson)
}

exit

