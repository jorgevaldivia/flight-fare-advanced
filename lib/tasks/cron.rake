desc "The task that runs the import"
task :cron => :environment do
  flights = Flight.all

  flights.each do |flight|
    doc = Nokogiri::XML(open("http://www.kayak.com/h/rss/fare?code=#{flight.origin}&dest=#{flight.destination}&tm=#{flight.year}#{flight.month}"))
    links = Array.new()

    doc.xpath("//item").each do |n| 
      x = Hash.new
      n.xpath("*").each do |n|
        x[n.name] = n.text
      end

      stat = Stat.new
      stat.flight_id = flight.id
      stat.price = x["price"]
      stat.airline = x["airline"]
      stat.link = x["link"]
      stat.departure_date = x["departDate"]
      stat.return_date = x["returnDate"]
      stat.save
    end # end doc 

  end # end flights
end
