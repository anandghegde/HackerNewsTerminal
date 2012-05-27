require 'rubygems'
require 'nokogiri'
require 'open-uri'

def fetch_hacker_news_page()
	url="http://news.ycombinator.com/news"
	page=Nokogiri::HTML(open(url))
	i=1
	j=1
	puts "------------------ Top News -------------"
	page.xpath('/html/body/center/table//tr[3]/td/table//tr').each do |item|
		if (i-1)%3==0
			title=item.xpath('./td[3]').text
			if title!=''
				print j
				print "\t"
				puts title
				print "\t"
				puts item.xpath('./td[3]/a/@href')
				puts "------------------------------------------------------------"
			end
			j=j+1
			
		end
		i=i+1
		#puts item
	end
end

fetch_hacker_news_page