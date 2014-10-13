module Billboard
  class Fetcher
    def provinces
      doc.css('.listaprovincias ul li a').map do |link|
        {
            name: link.text.match(/(.+)\(\d+\)/i).captures.first.strip,
            url:  link.attributes['href'].value
        }
      end
    end

    def cities(url = 'http://www.ecartelera.com/cines/0,18,0.html')
      doc(url).css('.listaciudades ul li a').map do |link|
        {
            name: link.text.match(/(.+)\(\d+\)/i).captures.first.strip,
            url:  link.attributes['href'].value
        }
      end
    end

    def cinemas(url = 'http://www.ecartelera.com/cines/0,18,41.html')
      doc(url).css('.listacines ul li a:not(.inactivo)').map do |link|
        {
            name: link.text,
            url:  link.attributes['href'].value
        }
      end
    end

    def films(url = 'http://www.ecartelera.com/cines/cinesa-marineda-city')
      (Date.today..(Date.today + 6)).each_with_object({}) do |date, dates_hash|
        formatted_date = date.strftime("%Y-%m-%d")
        dates_hash[formatted_date] = []
        doc("#{url}/#{formatted_date}").css('div.cajacinepeli').
            each_with_object(dates_hash[formatted_date]) do |film_box, date_array|
          next if film_box.css('h3').text.size.eql? 0
          info = film_box.css('p').text.gsub(/\t|\n/,"").split("|").map(&:strip)
          film_attributes = {
              title: film_box.css('h3').text,
              hours: film_box.css('h5 div').text.scan(/(\d+:\d+)/).flatten,
              length: info[0],
              country: info[1],
              age: info[2],
              image: film_box.css('img').first.attributes['src'].text
          }
          date_array << film_attributes
        end
      end
    end

    private

    def doc(url = "http://www.ecartelera.com/cartelera/")
      @doc ||= Nokogiri::HTML open url
    end
  end
end