task :update_condos => :production do
  VaScrape.new
  Condo.destroy_all
  Zillow.new
end
