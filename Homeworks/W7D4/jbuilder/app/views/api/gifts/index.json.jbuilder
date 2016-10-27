json.array! @gifts.each do |gift|
  json.extract! gift, :title, :description, :guest_id
end
