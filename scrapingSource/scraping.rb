require 'selenium-webdriver'

driver = Selenium::WebDriver.for :remote, desired_capabilities: :chrome, url: "http://#{ENV['SELENIUM_HOST']}:4444/wd/hub"

# スクレイピング
driver.navigate.to(ENV['URL'])
if (driver.find_elements(:class => "info_list").size == 0)
  puts "no info_list"
  exit
end
info_list = driver.find_element(:class => "info_list")
scrapedNews = info_list.find_elements(:tag_name => "a")
count = scrapedNews.length - 1
newsItems = []
for i in 0..count do
  newsItem = { "url" => scrapedNews[i].attribute("href"), "text" => scrapedNews[i].text }
  newsItems.push(newsItem)
end
news = { "newsItems" => newsItems }
puts news

# JSON出力
news_json = JSON.pretty_generate(news, {:indent => "    "})
File.open("data/news.json", mode = "w") { |f|
  f.write(news_json)
}

pcr_table = driver.find_elements(:class => "datatable").last
rows = pcr_table.find_elements(:tag_name => "tr").last
total = rows.find_element(:tag_name => "td").find_element(:tag_name => "p")

data_hash = {}
File.open("data/data.json") do |file|
  data_hash = JSON.load(file)
end

data_hash["main_summary"]["value"] = total.text.delete(",").to_i

data_json = JSON.pretty_generate(data_hash, {:indent => "    "})
File.open("data/data.json", mode = "w") { |f|
  f.write(data_json)
}

exit

