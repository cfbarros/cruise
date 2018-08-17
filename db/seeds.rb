BIKE_PHOTOS = [
  'https://res.cloudinary.com/hiutwig/image/upload/v1534446284/yx2liwzo0gbveharvlox.jpg',
  'https://res.cloudinary.com/hiutwig/image/upload/v1534446776/hxygwzhtkjvmovbuz10k.jpg',
  'https://res.cloudinary.com/hiutwig/image/upload/v1534448714/cipg6zv7rb32v0swaqel.jpg',
  'https://res.cloudinary.com/hiutwig/image/upload/v1534448901/vnhdwdsb2jf4fjbtwxlu.jpg',
  'https://res.cloudinary.com/hiutwig/image/upload/v1534457955/xabwf7swx77gwzslzou1.jpg',
  'https://res.cloudinary.com/hiutwig/image/upload/v1534458024/evohav8cydzik9no4yps.jpg',
  'https://res.cloudinary.com/hiutwig/image/upload/v1534458307/s9dneitpft8uqkp8jgnv.jpg',
  'https://res.cloudinary.com/hiutwig/image/upload/v1534458500/jp6cf7bv05juganua8fp.jpg',
  'https://res.cloudinary.com/hiutwig/image/upload/v1534458659/agl5c1mhy1xfe2yzpn3r.jpg',
  'https://res.cloudinary.com/hiutwig/image/upload/v1534458816/dsl8hvukliijgr9zkbwt.jpg',
  'https://res.cloudinary.com/hiutwig/image/upload/v1534463835/yqf7hqu3z4dtpeepwjmw.jpg',
  'https://res.cloudinary.com/hiutwig/image/upload/v1534527151/q8cjuorj59trkacauzcs.jpg'
]

ADDRESSES = [
  'Visconde de Pirajá, 495, Ipanema, Rio de Janeiro',
  'Prudente de Morais, 300, Ipanema, Rio de Janeiro',
  'Visconde de Pirajá, 250, Ipanema, Rio de Janeiro',
  'Nascimento Silva, 600, Ipanema, Rio de Janeiro',
  'Carlos Gois, 340, Leblon, Rio de Janeiro',
  'Delfim Moreira, 300, Leblon, Rio de Janeiro',
  'Visconde de Albuquerque, 495, Leblon, Rio de Janeiro',
  'General San Martin, 695, Leblon, Rio de Janeiro',
  'Epitacio Pessoa, 900, Lagoa, Rio de Janeiro',
  'Epitacio Pessoa, 1000, Lagoa, Rio de Janeiro',
  'Epitacio Pessoa, 1100, Lagoa, Rio de Janeiro',
  'Epitacio Pessoa, 1200, Lagoa, Rio de Janeiro',
]


# creates a constant for kinds of bikes
KINDS = %w[Mountain Street Electric]
# creates a constant for size of bikes
SIZES = %w[Small Medium Large]
# iterates over creating a user and a bike and making the relation between the two
12.times do |n|
  puts 'Generating bikes and users'
  user = User.new(email: Faker::Internet.email, password: rand(100_000..999_999),
              first_name: Faker::BreakingBad.character, address: Faker::Address.full_address)
  bike = Bike.new(
    kind: KINDS.sample,
    brand: Faker::Esport.team,
    address: ADDRESSES[n],
    size: SIZES.sample, price: rand(10..25),
    remote_photo_url: BIKE_PHOTOS[n]
  )
  user.save
  bike.user = user
  sleep 1
  bike.save!
end

3.times do
  rent = Rent.new
  rent.user = User.find(rand(1..10))
  rent.bike = Bike.find(rand(1..10))
  rent.save!
end

cruise = User.new(email: "cruise@gmail.com", password: "999999", first_name: "Cruise",
            last_name: :bikes, address: "Rio de Janeiro")
cruise.save
rent = Rent.new
rent.user = cruise
rent.bike = Bike.find(rand(1..10))
rent.save
