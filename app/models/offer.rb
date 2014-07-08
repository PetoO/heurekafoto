require 'net/http'

class Offer < ActiveRecord::Base
  belongs_to :camera

  def self.parse_camera_from_heureka(camera_name)
    parse_url = url_from_name(camera_name)
    uri = URI(parse_url)
    html = Net::HTTP.get(uri)
    doc = Nokogiri::HTML.parse(html)

    doc.search('#offers .shopspr .shoppr').each do |div|
      anchor = div.search('.buy .link').first
      price = div.search('.pr .pricen').text.to_f
      Offer.create!(
        shop: anchor.text,
        url: anchor[:href],
        price: price
      )
    end

  end

  def self.url_from_name(name)
    url = 'http://digitalne-fotoaparaty.heureka.sk/'
    url += name.downcase.strip.gsub ' ', '-'
    url + '/'
  end
end
