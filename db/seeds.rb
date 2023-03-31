# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Airport.delete_all

Flight.delete_all

# Seed airports
Airport.create([{ airport_code: 'YYC'}, { airport_code: 'YEG'}, { airport_code: 'YFC'}, { airport_code: 'YQX'}, { airport_code: 'YHZ'}, { airport_code: 'YQM'}, { airport_code: 'YUL'}, { airport_code: 'YOW'}, { airport_code: 'YQB'}, { airport_code: 'YYT'}, { airport_code: 'YYZ'}, { airport_code: 'YVR'}, { airport_code: 'YWG'}])

#Seed flights

Flight.delete_all

airport_codes = Airport.pluck(:id)

def time_rand
  min_time = Time.now + 1.day
  max_time = Time.now + 2.year
  rand(min_time..max_time)
end

record = 0
100.times do
  record += 1
  print "\rCreated record ##{record}..."
  dep_code = airport_codes.sample
  arr_code = airport_codes.sample
  until dep_code != arr_code
    arr_code = airport_codes.sample
  end

  Flight.create(departure_airport_id: dep_code, arrival_airport_id: arr_code, departure_time: time_rand, flight_duration: rand(30..480))
end
