class AthletesSpider < Kimurai::Base
    @name = 'athletes_spider'
    @engine = :mechanize

    def self.process(url)
        @start_urls = [url]
        self.crawl!
    end

    def parse(response, url:, data: {})
        response.css("//div[@class="col-xs-12 col-md-6 col-athlete"]").each do |athlete|

        item = {}

        item[:name]     = athlete.css('div.name')&.text&.squish
        item[:team]     = athlete.css('div.name.p.span')&.text&.squish
        item[:belt]     = athlete.css('h4.subtitle')&.text&.squish
        item[:weight]   = athlete.css('h4.subtitle')&.text&.squish
        item[:place]    = athlete.css('div.position-athlete')&.text&.squish
        item[:gender]   = athlete.css('h4.subtitle')&.text&.squish
        item[:age]      = athlete.css('h4.subtitle')&.text&.squish

        Athlete.where(item).first_or_create
        end
    end
end