require 'rubygems'
 require 'nokogiri'
 require 'open-uri'
 
def getdata(idnum)
 url = "http://www.lastrounds.co.uk/component/option,com_bookmarks/Itemid,37/task,detail/catid,4/navstart,0/mode,0/id,#{idnum}/search,*/"

 doc = Nokogiri::HTML(open(url))

 output = doc.at_css('.contentheading .category:last').content
 name, area, type = output.split(' - ')
 barinfo = [name,area,type]
 doc.css('td strong').each do|l|
 barinfo<<l.content
 end
 p barinfo
 p barinfo.index("Close")
end



def change2stringadd1(input)
  var1 = Integer(input)
  var1=var1+1
  output = var1.to_s()
  end


idnum2 = '1422'
 pub1 = getdata(idnum2)
 idnum2 = change2stringadd1(idnum2)
 pub2 = getdata(idnum2)
 idnum2 = change2stringadd1(idnum2)
 pub3 = getdata(idnum2)

p "Bar name = #{pub1[1]}"
p "Opening #{pub1[10]} - #{pub1[11]} - #{pub1[12]}"
