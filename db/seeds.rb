Trip.destroy_all
User.destroy_all

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

trip = Trip.create(name: "Sunny Office", start_date: "Sun, 22 Jan 2022", end_date: "Sun, 12 March 2022")

TripUser.create(trip:, user: claire)
TripUser.create(trip:, user: yannick)
