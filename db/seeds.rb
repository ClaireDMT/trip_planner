require "open-uri"
Category.destroy_all
Attraction.destroy_all
Trip.destroy_all
User.destroy_all

p "Destroyed all"

CATEGORIES = [
  ["Flight", "fa-plane"],
  ["Lodging", "fa-bed"],
  ["Rental", "fa-car"],
  ["Restaurant", "fa-ustensils"],
  ["Bar", "fa-wine-glass"],
  ["Museums", "fa-building-columns"],
  ["Groceries", "fa-basket-shopping"],
  ["Gas", "fa-gas-pump"],
  ["Shopping", "fa-bag-shopping"],
  ["Transportation", "fa-train-subway"],
  ["Other", "fa-receipt"]
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
CATEGORIES.each { |cat| Category.create(name: cat[0], icon: cat[1]) }
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

jesus = User.create(email: "jesus@web.de", password: "123456", username: "jesus")
jesus_pic = URI.open("https://res.cloudinary.com/clairedmt/image/upload/v1671794394/annoyed.png")
jesus.photo.attach(io: jesus_pic, filename: "yannick.png", content_type: "image/png")
jesus.save
p "Users created"

file = URI.open("https://www.gannett-cdn.com/-mm-/a43ed58860e0a70c15ac14578720d373d70e242c/c=0-0-1798-1016/local/-/media/2019/01/04/USATODAY/USATODAY/636822059867874249-spain-zahara-overview-town-110118-rs.jpg")
trip = Trip.create(name: "Sunny Office", start_date: "Sun, 22 Jan 2023", end_date: "Sun, 12 March 2023")
trip.photo.attach(io: file, filename: "andalucia.jpg", content_type: "image/jpg")
trip.save

trip2 = Trip.create(name: "Jesus Pilgrimage", start_date: "Mon, 01 Jan 2023", end_date: "Tues, 02 Jan 2023")
file = URI.open("https://i.ytimg.com/vi/I12pHLv0OBA/maxresdefault.jpg")
trip2.photo.attach(io: file, filename: "jesus.jpg", content_type: "image/jpg")
trip.save

TripUser.create(trip:, user: claire)
TripUser.create(trip:, user: yannick)
TripUser.create(trip: trip2, user: jesus)
TripUser.create(trip: trip2, user: claire)

p "Trips created"

category = Category.find_by(name: "Lodging")
lodging = Lodging.create(
  name: "El Tesorillo",
  link: "https://www.airbnb.com/rooms/15694960?adults=2&children=0&infants=0&location=Moj%C3%A1car%2C%20Espa%C3%B1a&pets=0&check_in=2023-05-19&check_out=2023-05-24&federated_search_id=0e84c867-88cd-41fe-8268-2909f10edfb9&source_impression_id=p3_1671531217_LSqZyIDDWAJ6yXrH",
  start_time: "Sun, 22 Jan 2023",
  end_time: "Mon, 30 Jan 2023",
  address: "Guájar-Alto, Andalucía, Spain",
  trip:,
  price_cents: 200
)


Expense.create!(
  user: claire,
  trip:,
  lodging:,
  category:,
  date: lodging.start_time,
  price_cents: 200,
  comment: lodging.name
)

lodging = Lodging.create(
  name: "La Isla Bonita - Mojacar house on the hill",
  link: "https://www.airbnb.com/rooms/34787366?adults=2&location=Moj%C3%A1car%2C%20Espa%C3%B1a&check_in=2023-01-21&check_out=2023-01-30&federated_search_id=742f3b5f-a8ab-4d58-93c9-d26ad370da64&source_impression_id=p3_1671530118_LfPkPNI%2FepXf%2BKGK",
  start_time: "Mond, 30 Jan 2023",
  end_time: "Tues, 07 Feb 2023",
  address: "Mojácar, Almería, Spain",
  trip:,
  price_cents: 100,
)

Expense.create!(
  user: yannick,
  trip:,
  lodging:,
  category:,
  date: lodging.start_time,
  price_cents: 100,
  comment: lodging.name
)

# for test

lodging_jesus = Lodging.create(
  name: "El BLALA",
  link: "https://www.airbnb.com/rooms/15694960?adults=2&children=0&infants=0&location=Moj%C3%A1car%2C%20Espa%C3%B1a&pets=0&check_in=2023-05-19&check_out=2023-05-24&federated_search_id=0e84c867-88cd-41fe-8268-2909f10edfb9&source_impression_id=p3_1671531217_LSqZyIDDWAJ6yXrH",
  start_time: "Mond, 01 Jan 2023",
  end_time: "Tues, 02 Jan 2023",
  address: "Cordoba, Andalucía, Spain",
  trip:,
  price_cents: 50
)

Expense.create!(
  trip: trip2,
  lodging: lodging_jesus,
  category:,
  date: lodging_jesus.start_time,
  price_cents: 50,
  comment: lodging_jesus.name
)
