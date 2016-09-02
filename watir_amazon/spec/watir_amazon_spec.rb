require 'spec_helper'
require 'watir-webdriver'

describe "Amazon" do	
	it "should search for Object Oriented Programming: Questions and Answers on Amazon" do
		search
		#Expected Result
		expect(@check_book).to eq true
		expect(@price).to eq "£10.30"
	end
	it "should list all the result from the search for Object Oriented Programming on Amazon" do
		search_results
		#Expected Result
		@books.each do |book|
			puts "-"
			puts "Book: #{book[0]}"
			puts "Price: #{book[1]}"
			puts "-"
		end
	end
end