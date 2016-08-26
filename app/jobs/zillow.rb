class Zillow

  def initialize
    @agent = Mechanize.new
    @agent.verify_mode = OpenSSL::SSL::VERIFY_NONE
    @add_search_url = "http://www.zillow.com/webservice/GetSearchResults.htm?zws-id=X1-ZWz19lv1cfv0uj_9k5bc&address="
  end

  def get_zpids(address)
    addy = address.gsub(",", "")
    parts = addy.split(" ")
    page = @agent.get("#{@add_search_url}#{parts[0]}+#{parts[1]}+#{parts[2]}+#{parts[3]}+&citystatezip=Washington%2C+DC")
    zpids = []
    page.search("zpid").each do |zpid|
      zpids << zpid.children.to_s
    end
    zpids
  end



  def get_statuses(zpids)
    statuses = []
    zpids.each do |zpid|
      page = @agent.get("http://www.zillow.com/homedetails/#{zpid}_zpid/")
      #statuses << page.search(".status-icon-row").children[3].children.to_s
      statuses << page.search("#home-value-wrapper .for-sale-row").first.text.strip
    end
    statuses
  end


end
