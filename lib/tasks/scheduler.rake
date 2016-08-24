task :update_condos => :production do
  Condo.destroy_all
  VaScrape.new
end
