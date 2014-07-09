class Camera < ActiveRecord::Base

  def self.parse_from_heureka(html)
    doc = Nokogiri::HTML.parse(html)

    doc.search('.p .desc').map do |div|
      #desc = div.search('h2 a').first
      Camera.create!(
          name:  div.search('.product-container h2 a').text,
          description: div.search('.desc').text[0,250],
          rating: div.search('.rw .textual').text[/\d+/].to_i,
      )
    end
  end

end
