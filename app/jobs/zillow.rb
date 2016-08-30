class Zillow

  def initialize
    @agent = Mechanize.new
    @agent.verify_mode = OpenSSL::SSL::VERIFY_NONE
    @add_search_url = "http://www.zillow.com/webservice/GetSearchResults.htm?zws-id=X1-ZWz19lv1cfv0uj_9k5bc&address="
    Address.all.each do |address|
      make_condos(get_zpids(address), address)
    end
  end


  def get_zpids(address_obj)
    address = address_obj.address
    addy = address.gsub(",", "")
    parts = addy.split(" ")
    page = @agent.get("#{@add_search_url}#{parts[0]}+#{parts[1]}+#{parts[2]}+#{parts[3]}+&citystatezip=Washington%2C+DC")
    zpids = []
    page.search("zpid").each do |zpid|
      zpids << zpid.children.to_s
    end
    zpids
  end


  def make_condos(zpids, address_obj)
    zpids.each do |zpid|
      page = @agent.get("http://www.zillow.com/homedetails/#{zpid}_zpid/")
      status = page.search(".status-icon-row").children.text.strip
      if status == "For Sale"
        stuff = page.search(".addr_bbs")
        beds = stuff[0].text.to_i
        baths = stuff[1].text.to_f
        sq_ft = stuff[2].text.gsub(",", "").to_i
        price = page.search(".main-row").text.strip.split("$")[-1].gsub(",", "").to_i
        address = page.search(".notranslate")[0].text.strip
        Condo.create(street_address: address, city: "Washington", state: "DC", price: price, sq_ft: sq_ft, beds: beds, baths: baths, zillow_id: zpid.to_i, address_id: address_obj.id)
      end
    end
  end

end
