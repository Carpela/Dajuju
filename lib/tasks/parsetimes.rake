def parse_times bar
  p bar.name

  day_names = %w{Monday Tuesday Wednesday Thursday Friday Saturday Sunday}

  bar.opentimes.each do |time|
    days = time.days
    if days.index('-')
      data = days.split('-')
      start, finish = data
      start = start.match("[A-Za-z]+")[0].slice(0, 3)
      finish = finish.match("[A-Za-z]+")[0].slice(0, 3)
      for day in day_names
        if day.match /^#{start}/
          start = day
        end
        if day.match /^#{finish}/
          finish = day
        end
      end

      start_index, end_index = day_names.index(start), day_names.index(finish)      
      (start_index..end_index).each do |day|
        p "#{day_names[day]}, #{time.start}, #{time.finish}"
        time.bar.opentimes << Opentime.new(:days => day_names[day], :start => time.start, :finish => time.finish)
      end
    elsif days.index(':')
      time.days = days.chomp(':')
      time.save
      p "#{time.days}, #{time.start}, #{time.finish}"
    else
      p "#{time.days}, #{time.start}, #{time.finish}"
    end
  end
  p '---------------'
end

desc "Collects pub data and seeds the database"
task :parse_opentimes => :environment do
  Bar.all.each { |bar| parse_times(bar) }
end
