require "open-uri"
Category.destroy_all
Trip.destroy_all
User.destroy_all

p "Destroyed all"

CATEGORIES = [
  "Flight",
  "Lodging",
  "Rental",
  "Restaurant",
  "Bar",
  "Museums",
  "Groceries",
  "Gas",
  "Shopping",
  "Transportation",
  "Other"
]

CATEGORIES.each { |cat| Category.create(name: cat) }

claire = User.create(email: "clair_demont@hotmail.com", password: "123456", username: "clarinette")
yannick = User.create(email: "pirmin@web.de", password: "123456", username: "yanniquito")

file = URI.open("https://www.gannett-cdn.com/-mm-/a43ed58860e0a70c15ac14578720d373d70e242c/c=0-0-1798-1016/local/-/media/2019/01/04/USATODAY/USATODAY/636822059867874249-spain-zahara-overview-town-110118-rs.jpg")
trip = Trip.create(name: "Sunny Office", start_date: "Sun, 22 Jan 2022", end_date: "Sun, 12 March 2022")
trip.photo.attach(io: file, filename: "andalucia.jpg", content_type: "image/jpg")
trip.save

TripUser.create(trip:, user: claire)
TripUser.create(trip:, user: yannick)
