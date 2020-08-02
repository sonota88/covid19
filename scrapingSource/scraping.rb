require 'selenium-webdriver'

driver = Selenium::WebDriver.for :remote, desired_capabilities: :chrome, url: "http://#{ENV['SELENIUM_HOST']}:4444/wd/hub"

# スクレイピング
driver.navigate.to(ENV['URL'])
if (driver.find_elements(:class => "info_list").size == 0)
  print "no list_table\n"
  exit
end
list_table = driver.find_element(:class => "info_list")
scrapedNews = list_table.find_elements(:tag_name => "a")
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

exit

