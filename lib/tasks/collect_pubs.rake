
def remove_newlines str
  str.gsub /[\n\r\t]/, ''
end

def download_one_pub url
  bar_data = {}
  # url = "http://www.lastrounds.co.uk/component/option,com_bookmarks/Itemid,37/task,detail/catid,4/navstart,0/mode,0/id,#{id}/search,*/"
  p url
  bar_data[:lr_url] = url
  doc = Nokogiri::HTML(open(url))

  output = doc.at_css('.contentheading .category:last').content
  # Note the pseudo tag in html which we can use to find the specific thing we're after
  # http// CSS pseudo selectors. Good list at w3schools
  
  # Ruby cheat sheet
  
  name, area, type = output.split(' - ')
  p name, area, type  
  
  address = remove_newlines doc.at_css('.separator strong:first').content
  p address
  
  bar_data[:address] = address
  bar_data[:name] = name
  bar_data[:area] = area
  bar_data[:type] = type
  
  
  #Research regular expressions, used here to break up the string
  phone_div = doc.css('.separator strong')[1].content
  if not phone_div.blank? and phone_div.match(/\d+/)
      bar_data[:phone] = phone_div.match(/\d+/)[0]
  end

  website = doc.at_css('a[target="_blank"]').attr('href')
  
  bar_data[:website] = website
  p website

  bar = Bar.find_or_initialize_by_address address
  bar.update_attributes! bar_data

  #barinfo = [name,area,type,address,website]

  barinfo = []
  doc.css('td strong').each do |l|
    barinfo<<l.content
  end

  i = barinfo.index("Close") + 1

  bar.opentimes.destroy_all
  while true do
    if barinfo[i+1].match /^\d\d\d\d/
      days = barinfo[i]
      otime = barinfo[i+1]
      ctime = barinfo[i+2]
      p [days, otime, ctime]
      bar.opentimes << Opentime.new(:days => days, :start => otime, :finish => ctime)
    
      i += 3
    elsif barinfo[i+1].downcase == "closed"
      days = barinfo[i]
      otime = barinfo[i+1]
      ctime = barinfo[i+1]
      p [days, otime, ctime]
      bar.opentimes << Opentime.new(:days => days, :start => otime, :finish => ctime)

      i += 2
    else
      break
    end
  end
end

desc "Collects pub data and seeds the database"
task :collect_pub_data => :environment do
	require 'nokogiri'
	require 'open-uri'
  logfile = File.open 'errors.log', 'w'

	26.times do |page|
  	pubs_url = "http://www.lastrounds.co.uk/component/option,com_bookmarks/Itemid,37/mode,0/catid,4/navstart,#{page}/search,*/"
    doc = Nokogiri::HTML(open(pubs_url))
    selector = 'a[href*="http://www.lastrounds.co.uk/component/option,com_bookmarks/Itemid,37/task,detail/catid,4/"]'
    links = doc.css(selector).map { |c| c.attr('href') }.uniq
  
    links.each { |link|
      begin
        download_one_pub link
      rescue
        msg = "Data collection failed for link #{link}"
        logfile.write msg
        p msg
      end
    }
  end
end

