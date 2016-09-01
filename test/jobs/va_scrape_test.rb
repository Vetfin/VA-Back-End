require 'test_helper'

class VaScrapeTest < ActiveSupport::TestCase
  def test_can_scrape_va
    VCR.use_cassette("synopsis") do
      Building.delete_all
      assert_difference(->{ Building.count }, 219) do
        scraper = VaScrape.new
      end
    end
  end
end
