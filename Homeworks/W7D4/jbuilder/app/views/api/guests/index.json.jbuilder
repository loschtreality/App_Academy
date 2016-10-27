json.array! @guests.each do |guest|
  json.extract! guest, :name, :age, :favorite_color
end
