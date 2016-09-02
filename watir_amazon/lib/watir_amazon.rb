require 'watir-webdriver'

def search
	#Open Amazon in chrome
	browser = Watir::Browser.new :chrome
	browser.goto "https://www.amazon.co.uk/"
	browser.input(:id => "twotabsearchtextbox").click
	browser.send_keys "Object Oriented Programming: Questions and Answers\n"
	@check_book = browser.text.include?("Object Oriented Programming: Questions and Answers")
	browser.link(:class => "a-link-normal s-access-detail-page  a-text-normal").click
	@price = browser.span(:class => "a-size-medium a-color-price offer-price a-text-normal").text
	browser.quit
end

def search_results
	browser = Watir::Browser.new :chrome
	browser.goto "https://www.amazon.co.uk/"
	browser.input(:id => "twotabsearchtextbox").click
	browser.send_keys "Object Oriented Programming\n"
	@results = []
	@books = []
	amazon_results = browser.ul(:id => "s-results-list-atf")
	amazon_results.lis.each do |li|
		@results << li.id
	end
	@results.each do |id|
		if id != ""
			book = []
			book << browser.li(:id => "#{id}").h2.text
			book << browser.li(:id => "#{id}").span(:class => "a-size-base a-color-price s-price a-text-bold").text
			@books << book
		end
	end
end