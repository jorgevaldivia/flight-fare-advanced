desc "The task that runs the import"
task :cron => :environment do
  flights = Flight.all

  flights.each do |flight|
    doc = Nokogiri::XML(open("http://www.kayak.com/h/rss/fare?code=#{flight.origin}&dest=#{flight.destination}&tm=#{flight.year}#{flight.month}"))
    links = Array.new()

    best = Hash.new
    best["price"] = 100000

    doc.xpath("//item").each do |n| 
      current = Hash.new
      n.xpath("*").each do |n|
        current[n.name] = n.text
      end

      if(current["price"].to_i < best["price"].to_i)
        best = current
      end # end if current
    end # end doc 

    stat = Stat.new
    stat.flight_id = flight.id
    stat.price = best["price"]
    stat.airline = best["airline"]
    stat.link = best["link"]
    stat.departure_date = best["departDate"]
    stat.return_date = best["returnDate"]
    stat.save


  end # end flights
end
