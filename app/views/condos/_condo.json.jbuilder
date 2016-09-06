json.extract! condo,
  :id,
  :street_address,
  :city,
  :state,
  :zipcode,
  :condo_name,
  :price,
  :sq_ft,
  :beds,
  :baths,
  :parking,
  :hoa,
  :zillow_id,
  :created_at,
  :updated_at,
  :building_id,
  :status

json.latitude condo.building.latitude
json.longitude condo.building.longitude
json.formatted_address condo.building.formatted_address
