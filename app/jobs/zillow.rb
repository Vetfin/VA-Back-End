class Zillow

  def initialize
    @agent = Mechanize.new
    @agent.verify_mode = OpenSSL::SSL::VERIFY_NONE
    @add_search_url = "http://www.zillow.com/webservice/GetSearchResults.htm?zws-id=X1-ZWz19lv1cfv0uj_9k5bc&address="
    Address.all.each do |address|
      update_condos(address)
    end
  end


  def update_condos(address_obj)
    address = address_obj.address
    addy = address.gsub(",", "")
    parts = addy.split(" ")
    page = @agent.get("#{@add_search_url}#{parts[0]}+#{parts[1]}+#{parts[2]}+#{parts[3]}+&citystatezip=Washington%2C+DC")
    page.search("zpid").each do |zpid|
      zil_id = zpid.children.to_s
      if get_status(zil_id) == "For Sale"
        stuff = page.search(".addr_bbs")
        beds = stuff[0].text.to_i
        baths = stuff[1].text.to_f
        sq_ft = stuff[2].text.gsub(",", "").to_i
        price = page.search(".main-row").text.strip.split("$")[-1].gsub(",", "").to_i
        Condo.create(street_address: address, city: "Washington", state: "DC", condo_name: address_obj.name, price: price, sq_ft: sq_ft, beds: beds, baths: baths, zillow_id: zil_id.to_i, address_id: address_obj.id)
      end
    end
  end


  def get_status(zpid)
    zpids.each do |zpid|
      page = @agent.get("http://www.zillow.com/homedetails/#{zpid}_zpid/")
      status = page.search(".status-icon-row").children.text.strip
    end
    status
  end


end
