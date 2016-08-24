#require "rubygems"
# require "mechanize"
# require "nokogiri"
# require "pry"

class VaScrape

  def initialize
    agent = Mechanize.new
    @page = agent.get("https://vip.vba.va.gov/portal/VBAH/VBAHome/condopudsearch?paf_portalId=default&paf_communityId=100002&paf_pageId=500002&paf_dm=full&paf_gear_id=800001&paf_gm=content&paf_ps=_rp_800001_condoName%3D1_%26_rp_800001_approvedOnly%3D1_yes%26_rp_800001_condoId%3D1_%26_ps_800001%3Dmaximized%26_pid%3D800001%26_rp_800001_county%3D1_%26_rp_800001_stateCode%3D1_DC%26_md_800001%3Dview%26_rp_800001_cpbaction%3D1_performSearchPud%26_st_800001%3Dmaximized%26_rp_800001_reportType%3D1_details%26_rp_800001_regionalOffice%3D1_%26_rp_800001_city%3D1_&_requestid=564820")
    persist(get_addresses)
  end


  def get_addresses
    condos = []
    @page.search(".inputpanelfields").each do |condo|
      rows = condo.search("tr")
      condos << rows
    end

    records = []
    condos.each do |condo|
      records << condo[1].children.map {|child| child.content.gsub("\t", "")}
    end

    addresses = []
    records.each do |record|
      addresses << record[3].gsub("\n", " ").strip
    end

    addresses
  end

  def persist(addys)
    addys.each do |addy|
      Condo.create(address: addy)
    end
  end

end
