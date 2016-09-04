class VaScrape

  def initialize
    @agent = Mechanize.new
    @agent.verify_mode = OpenSSL::SSL::VERIFY_NONE
    @va_page = @agent.get("https://vip.vba.va.gov/portal/VBAH/VBAHome/condopudsearch?paf_portalId=default&paf_communityId=100002&paf_pageId=500002&paf_dm=full&paf_gear_id=800001&paf_gm=content&paf_ps=_rp_800001_condoName%3D1_%26_rp_800001_approvedOnly%3D1_yes%26_rp_800001_condoId%3D1_%26_ps_800001%3Dmaximized%26_pid%3D800001%26_rp_800001_county%3D1_%26_rp_800001_stateCode%3D1_DC%26_md_800001%3Dview%26_rp_800001_cpbaction%3D1_performSearchPud%26_st_800001%3Dmaximized%26_rp_800001_reportType%3D1_details%26_rp_800001_regionalOffice%3D1_%26_rp_800001_city%3D1_&_requestid=564820")
    @add_search_url = "http://www.zillow.com/webservice/GetSearchResults.htm?zws-id=X1-ZWz19lv1cfv0uj_9k5bc&address="
    persist(get_addresses)
    update_condos
  end


  def get_addresses
    buildings = []
    @va_page.search(".inputpanelfields").each do |building|
      rows = building.search("tr")
      buildings << rows
    end

    records = []
    buildings.each do |building|
      records << building[1].children.map {|child| child.content.gsub("\t", "")}
    end

    addresses = []
    records.each do |record|
      addresses << record[3].gsub("\n", " ").strip
    end

    addresses.select{|address| address[0].to_i.to_s == address[0]}
  end


  def persist(addys)
    old_addys = Building.pluck(:address)
    adds_to_remove = old_addys - addys
    adds_to_add = addys - old_addys

    adds_to_remove.each do |atr|
      Building.find_by(address: atr).destroy
    end

    adds_to_add.each do |ata|
      building = Building.create(address: ata)
      if building.latitude
        zpids = get_zpids(building)
        zpids.each do |zpid|
          Condo.create(zillow_id: zpid.to_i, building_id: building.id)
        end
      end
    end
  end


  def get_zpids(building_obj)
    address = building_obj.formatted_address
    addy = address.gsub(",", "")
    parts = addy.split(" ")
    page = @agent.get("#{@add_search_url}#{parts.first}+#{parts[1]}+#{parts[2]}+#{parts[3]}+&citystatezip=Washington%2C+DC")
    page.search("zpid").map {|zpid| zpid.children.to_s}
  end


  def update_condos
    Condo.all.each do |condo|
      begin
        page = @agent.get("http://www.zillow.com/homedetails/#{condo.zillow_id.to_s}_zpid/")
        status = page.search(".status-icon-row").children.text.strip
        stuff = page.search(".addr_bbs")
        beds = stuff.first.text.to_i
        baths = stuff[1].text.to_f
        sq_ft = stuff[2].text.gsub(",", "").to_i
        price = page.search(".main-row").text.strip.split("$")[-1].gsub(",", "").to_i
        address = page.search(".notranslate").first.text.strip
        condo.update(street_address: address, city: "Washington", state: "DC", price: price, sq_ft: sq_ft, beds: beds, baths: baths, status: status)
      rescue NoMethodError
      end
    end
  end

end
