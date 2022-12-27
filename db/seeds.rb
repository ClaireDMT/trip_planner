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
PLACE_CATEGORIES = [
  "Museum",
  "Parc and Garden",
  "Natural Reserves",
  "Religious Building",
  "Beach",
  "Town",
  "Neighbourhood"
]
CATEGORIES.each { |cat| Category.create(name: cat) }
PLACE_CATEGORIES.each { |cat| Attraction.create(name: cat) }
p "Categories created"

claire = User.new(email: "clair_demont@hotmail.com", password: "123456", username: "clarinette")
claire_pic = URI.open("https://res.cloudinary.com/clairedmt/image/upload/v1671794271/smile.png")
claire.photo.attach(io: claire_pic, filename: "claire.png", content_type: "image/png")
claire.save

yannick = User.create(email: "pirmin@web.de", password: "123456", username: "yanniquito")
yannick_pic = URI.open("https://res.cloudinary.com/clairedmt/image/upload/v1671794394/annoyed.png")
yannick.photo.attach(io: yannick_pic, filename: "yannick.png", content_type: "image/png")
yannick.save

file = URI.open("https://www.gannett-cdn.com/-mm-/a43ed58860e0a70c15ac14578720d373d70e242c/c=0-0-1798-1016/local/-/media/2019/01/04/USATODAY/USATODAY/636822059867874249-spain-zahara-overview-town-110118-rs.jpg")
trip = Trip.create(name: "Sunny Office", start_date: "Sun, 22 Jan 2022", end_date: "Sun, 12 March 2022")
trip.photo.attach(io: file, filename: "andalucia.jpg", content_type: "image/jpg")
trip.save

p "Users created"

TripUser.create(trip:, user: claire)
TripUser.create(trip:, user: yannick)
category = Category.find_by(name: "Lodging")


lodging = Lodging.create(
  name: "El Tesorillo",
  link: "https://www.airbnb.com/rooms/15694960?adults=2&children=0&infants=0&location=Moj%C3%A1car%2C%20Espa%C3%B1a&pets=0&check_in=2023-05-19&check_out=2023-05-24&federated_search_id=0e84c867-88cd-41fe-8268-2909f10edfb9&source_impression_id=p3_1671531217_LSqZyIDDWAJ6yXrH",
  start_time: "Sun, 22 Jan 2022",
  end_time: "Mon, 30 Jan 2022",
  address: "Guájar-Alto, Andalucía, Spain",
  trip:
)
Expense.create(
  trip:,
  lodging:,
  category:,
  date: lodging.start_time
)

lodging = Lodging.create(
  name: "La Isla Bonita - Mojacar house on the hill",
  link: "https://www.airbnb.com/rooms/34787366?adults=2&location=Moj%C3%A1car%2C%20Espa%C3%B1a&check_in=2023-01-21&check_out=2023-01-30&federated_search_id=742f3b5f-a8ab-4d58-93c9-d26ad370da64&source_impression_id=p3_1671530118_LfPkPNI%2FepXf%2BKGK",
  start_time: "Mond, 30 Jan 2022",
  end_time: "Tues, 07 Feb 2022",
  address: "Mojácar, Almería, Spain",
  trip:
)

Expense.create(
  trip:,
  lodging:,
  category:,
  date: lodging.start_time
)
