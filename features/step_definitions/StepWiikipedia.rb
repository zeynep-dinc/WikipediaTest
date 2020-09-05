require 'selenium-webdriver'
require 'rubygems'
require 'rspec'


Selenium::WebDriver::Chrome.driver_path="..\\WikipediaTest\\chromedriver.exe"
driver = Selenium::WebDriver.for:chrome   

Given('wikipediaya git') do
  driver.navigate.to "https://www.wikipedia.org/"
  driver.manage.window.maximize
  sleep(2)
end

Then('Türkçeye tıkla') do
  driver.find_element(:id,'js-link-box-tr').click()
  sleep(5)
  #doğrulama için sayfa başlığı kontrol edilecektir
  baslik=driver.title
  log(baslik)
  # baslik değşkeni Vikipedi: Özgür Ansiklopedi bu değere eşit mi?
  expect(baslik).to eq('Vikipedi: Özgür Ansiklopedi')
end

Then('Rastgele Madde linkine tıkla') do
	driver.find_element(:id,'n-randompage').click()
	sleep(2)
	rastgeleDegerim=driver.find_element(:id,'firstHeading').text
	log("Rastgele çıkan değer : ",rastgeleDegerim)
end

Then('Vikipedi üzerinde ara çubuğuna tıklanır Yazılım kelimesi aratılır') do 
	sleep(2)
  aramaCubugu=driver.find_element(:name,'search')
  aramaCubugu.click()
  log("arama çubuğuna tıkladım")
  sleep(10)
  aramaCubugu.send_keys 'yazılım'
  log("mesaji yazdim")
  sleep(5)
  aramaCubugu.send_keys :enter
  log("yazılım aratıldı")
end

Then('Yazılım kelimesinin aratıldığı doğrula') do 
  	 sleep(10)
  	rastgeleDegerim=driver.find_element(:id,'firstHeading').text
  	expect(rastgeleDegerim).to eq('Yazılım')
end

Then('İlk kaynağa tıkla') do
	 driver.find_element(:xpath,'//*[@id="cite_ref-1"]/a').click()
	sleep(2)
	log(driver.current_url)
	expect(driver.current_url).to eq('https://tr.wikipedia.org/wiki/Yaz%C4%B1l%C4%B1m#cite_note-1')
end

After do
    log("test bitiriliyor")
    driver.quit()
end
