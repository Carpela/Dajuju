def download_one_pub url
  # url = "http://www.lastrounds.co.uk/component/option,com_bookmarks/Itemid,37/task,detail/catid,4/navstart,0/mode,0/id,#{id}/search,*/"
  doc = Nokogiri::HTML(open(url))

  output = doc.at_css('.contentheading .category:last').content
  # Note the pseudo tag in html which we can use to find the specific thing we're after
  # http// CSS pseudo selectors. Good list at w3schools
  
  # Ruby cheat sheet
  name, area, type = output.split(' - ')
  p name, area, type  
  
  address = doc.at_css('.separator strong:first').content
  p address
  
  #Research regular expressions, used here to break up the string
  phone = doc.css('.separator strong')[1].content.match(/\d+/)[0]
  p phone
  website = doc.at_css('a[target="_blank"]').attr('href')
  p doc.css('a[target=_blank]').length
  p doc.css('a[target=_blank]').map {|c| c.attr('href')}
  p website
  
end

desc "Collects pub data and seeds the database"
task :collect_pub_data => :environment do
	require 'nokogiri'
	require 'open-uri'

	page = 0
	pubs_url = "http://www.lastrounds.co.uk/component/option,com_bookmarks/Itemid,37/mode,0/catid,4/navstart,#{page}/search,*/"
  doc = Nokogiri::HTML(open(pubs_url))
  selector = 'a[href*="http://www.lastrounds.co.uk/component/option,com_bookmarks/Itemid,37/task,detail/catid,4/"]'
  links = doc.css(selector).map { |c| c.attr('href') }.uniq

  links.each { |link| download_one_pub link }
end

