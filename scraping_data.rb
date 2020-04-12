require 'selenium-webdriver'

driver = Selenium::WebDriver.for :remote, desired_capabilities: :chrome, url: "http://#{ENV['SELENIUM_HOST']}:4444/wd/hub"

# スクレイピング
driver.navigate.to(ENV['URL'])
list_table = driver.find_element(:class => "list_table")
# dates = list_table.find_elements(:class => "date")
urls = list_table.find_elements(:tag_name => "a")
# texts = list_table.find_elements(:tag_name => "a")
count = urls.length - 1
url = urls[count].attribute("href")
puts "news url = "
puts url

exit

