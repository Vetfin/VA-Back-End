class Zillow

  def initialize
    @agent = Mechanize.new
    @agent.verify_mode = OpenSSL::SSL::VERIFY_NONE
    @base_url = "http://www.zillow.com/webservice/GetSearchResults.htm?zws-id=X1-ZWz19lv1cfv0uj_9k5bc&address="
  end

  def get_zpid(address)
    addy = address.gsub(",", "")
    parts = addy.split(" ")
    page = @agent.get("#{@base_url}#{parts[0]}+#{parts[1]}+#{parts[2]}+#{parts[3]}+&citystatezip=Washington%2C+DC")
    zpid = page.search("zpid").children.to_s
    zpid
  end

  def get_listing

  end


#1500+Eaton+Pl&citystatezip=Washington%2C+DC
end
