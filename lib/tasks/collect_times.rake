def download_time url
  
  doc = Nokogiri::HTML(open(url))
  output = doc.at_css('.contentheading .category:last').content
end