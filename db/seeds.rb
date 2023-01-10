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
  name: "La Isla Bonita - Mojacar house on the hill",
  link: "https://www.airbnb.com/rooms/34787366?source_impression_id=p3_1673386138_Vq7eapbCbKjfK9Wb",
  start_time: "Sun, 22 Jan 2023",
  end_time: "Mon, 30 Jan 2023",
  address: "Mojácar, Almería 04638, Spain",
  trip:,
  price_cents: 397.60
)


Expense.create!(
  user: claire,
  trip:,
  lodging:,
  category:,
  date: lodging.start_time,
  price_cents: 397.60,
  comment: lodging.name
)

lodging = Lodging.create(
  name: "El Tesorillo Secluded mountain house",
  link: "https://www.airbnb.com/rooms/15694960?adults=1&children=0&infants=0&location=motril&pets=0&check_in=2023-05-22&check_out=2023-05-27&federated_search_id=dfca262c-89fa-4422-9032-82621fc8221f&source_impression_id=p3_1673386253_B9%2Fsqv1y0Q3WyC%2FV",
  end_time: "Tues, 07 Feb 2023",
  start_time: "Mon, 30 Jan 2023",
  address: "Guájar-Alto, Andalucía, Spain",
  trip:,
  price_cents: 388
)

Expense.create!(
  user: yannick,
  trip:,
  lodging:,
  category:,
  date: lodging.start_time,
  price_cents: 388,
  comment: lodging.name
)


lodging = Lodging.create(
  name: "Aljibes de las Azucenas I",
  link: "https://www.airbnb.com/rooms/696782559821972683?source_impression_id=p3_1673386567_KS7sDs54HxquAQUj",
  start_time: "Tues, 07 Feb 2023",
  end_time: "Sat, 11 Feb 2023",
  address: "Placeta Cristo Azucenas Bajo A, Granada, Andalucía 18010, Spain",
  trip:,
  price_cents: 253
)

Expense.create!(
  user: yannick,
  trip:,
  lodging:,
  category:,
  date: lodging.start_time,
  price_cents: 253,
  comment: lodging.name
)

lodging = Lodging.create(
  name: "Cozy apartment perfect for couples and families",
  link: "https://www.airbnb.com/rooms/24026540?source_impression_id=p3_1673386948_MylGWJYAMmMs3%2Bel",
  start_time: "Sat, 11 Feb 2023",
  end_time: "Frid, 17 Feb 2023",
  address: "Calle Antonio Susillo, 46 1º A, Sevilla, Andalucía 41002, Spain",
  trip:,
  price_cents: 438.53
)

Expense.create!(
  user: claire,
  trip:,
  lodging:,
  category:,
  date: lodging.start_time,
  price_cents: 438.53,
  comment: lodging.name
)

lodging = Lodging.create(
  name: "Cozy house near metro and Sevilla FC Stadium",
  link: "https://www.airbnb.com/rooms/599651211796083039?source_impression_id=p3_1673387186_5PKUbCgpmf4jvUDF",
  start_time: "Fri, 17 Feb 2023",
  end_time: "Frid, 24 Feb 2023",
  address: "Calle Antonio Ballesteros, 1, 41005 SEVILLA, ESPAÑA",
  trip:,
  price_cents: 490.80
)

Expense.create!(
  user: claire,
  trip:,
  lodging:,
  category:,
  date: lodging.start_time,
  price_cents: 490.80,
  comment: lodging.name
)

transit = Transit.create(
  start_time: "Sun, 22 Jan 2023 06:15",
  end_time: "Sun, 22 Jan 2023 09:45",
  transport_type: 0,
  paid: true,
  from: "Berlin",
  to: "Malaga",
  trip:
)

category = Category.find_by(name: "Flight")

Expense.create!(
  user: claire,
  trip:,
  transit:,
  category:,
  date: transit.start_time,
  price_cents: 151.96
)
