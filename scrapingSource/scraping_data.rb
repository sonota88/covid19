require 'selenium-webdriver'
require 'date'

today = Date.today.strftime("%Y/%m/%d")
driver = Selenium::WebDriver.for :remote, desired_capabilities: :chrome, url: "http://#{ENV['SELENIUM_HOST']}:4444/wd/hub"

# 最新ニュースのURL取得
driver.navigate.to(ENV['URL'])
datatable = driver.find_element(:class => "datatable")
trs = datatable.find_elements(:tag_name => "tr")

count = trs.length - 1
dataList = []
dates = {}
statusHash = {"入院中"=>0, "宿泊療養中"=>0, "退院" => 0, "死亡" => 0}

for i in 1..count do
  # 1行目は列名にあたるのでスキップする
  data = {}
  tr = trs[i]
  tds = tr.find_elements(:tag_name => "td")

  no = tds[0].text

  dataSplits = tds[1].text.split("月")
  month = dataSplits[0]
  if month.length == 1 then
    month = "0#{month}"
  end
  day = dataSplits[1].split("日")[0]
  if day.length == 1 then
    day = "0#{day}"
  end
  date = "2020-#{month}-#{day}T08:00:00.000Z"

  if dates.has_key?(date) == false then
    dates[date] = 1
  else
    dates[date] += 1
  end

  age = tds[2].text
  gender = tds[3].text
  address = tds[4].text.split("\n")[0]
  status = tds[5].text

  case status
  when "入院調整中", "入院中",
    statusHash["入院中"] += 1
  when "宿泊療養中"
    statusHash["宿泊療養中"] += 1
  when "死亡"
    statusHash["死亡"] += 1
  else
    statusHash["退院"] += 1
  end

  contactStatus = tds[6].text

  data["NO"] = no
  data["リリース日"] = date
  data["居住地"] = address
  data["年代"] = age
  data["性別"] = gender
  data["退院"] = status
  data["接触状況"] = contactStatus

  dataList.push(data)
end

reverseDates = Hash[dates.to_a.reverse]
patientsSummaryData = []
reverseDates.each do |key, value|
  patientsSummaryData.push({
                    "日付"=> key,
                    "小計"=> value
                })
end

statusHashList = []
statusHash.each do |key, value|
  statusHashList.push({
                      "attr"=>key,
                      "value"=>value
                  })
end

data_count = dataList.length

dataHash = {}
File.open("data/data.json") do |file|
  dataHash = JSON.load(file)
end

# data.json を更新
dataHash["lastUpdate"] = today
dataHash["patients"]["date"] = today
dataHash["patients"]["data"] = dataList
dataHash["main_summary"]["children"][0]["value"] = data_count
dataHash["main_summary"]["children"][0]["children"] = statusHashList
dataHash["patients_summary"]["data"] = patientsSummaryData

dataJson = JSON.pretty_generate(dataHash, {:indent => "    "})
File.open("data/data.json", mode = "w") { |f|
  f.write(dataJson)
}

exit
