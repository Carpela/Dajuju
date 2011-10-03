require 'rubygems'
require 'nokogiri'
require 'open-uri'

url = "http://www.lastrounds.co.uk/component/option,com_bookmarks/Itemid,37/task,detail/catid,4/navstart,0/mode,0/id,1282/search,*/"
doc = Nokogiri::HTML(open(url))
#open = "tr:nth-child(6) td:nth-child(2) strong , tr:nth-child(5) td:nth-child(2) strong, .adminform tr:nth-child(4) td:nth-child(2) strong, tr:nth-child(3) td:nth-child(2) strong"
open = ".adminform tr:nth-child(4) strong , tr:nth-child(5) strong, tr:nth-child(6) strong, .adminform .adminform table span.contentdescription , tr:nth-child(3) strong, .adminform .adminform table span.contentdescription"

optime2 = doc.css(open).each do

  p optime2

end

#rrrrp optimes

# All = .adminform tr:nth-child(4) strong , tr:nth-child(5) strong, tr:nth-child(6) strong, .adminform .adminform table span.contentdescription , tr:nth-child(3) strong, .adminform .adminform table span.contentdescription


# opening times tr:nth-child(6) td:nth-child(2) strong , tr:nth-child(5) td:nth-child(2) strong, .adminform tr:nth-child(4) td:nth-child(2) strong, tr:nth-child(3) td:nth-child(2) strong


#each do |time|
 # puts times.content
  
#end


#doc.at_css("tr:nth-child(3) strong").each do |time| 
#  time = time.content
#  p time
#end
