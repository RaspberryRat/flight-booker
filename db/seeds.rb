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
Airport.create([{ airport_code: 'YEG'}, { airport_code: 'YQM'}, { airport_code: 'YOW'}, { airport_code: 'YYZ'}, { airport_code: 'YVR'}])

# Seed flights

Flight.delete_all

airport_codes = Airport.pluck(:id)

def time_rand
  time = Time.now
  min_time = time + 1.day
  max_time = time + 1.month
  time = rand(min_time..max_time)
  Time.utc(time.year, time.month, time.day)
end

record = 0
10_000.times do
  record += 1
  print "\rCreated record ##{record}..."
  dep_code = airport_codes.sample
  arr_code = airport_codes.sample until dep_code != arr_code && !arr_code.nil?

  Flight.create(departure_airport_id: dep_code, arrival_airport_id: arr_code, departure_time: time_rand, flight_duration: rand(30..480))
end
