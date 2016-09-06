json.partial! @building
json.condos(@condos) do |condo|
  json.partial! condo
end
