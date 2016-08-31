task :update_condos => :environment do
  # VaScrape.new
  Condo.destroy_all
  Zillow.new
end
