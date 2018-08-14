
# creates a constant for kinds of bikes
KINDS = %w[Mountain Street Electric]
# creates a constant for size of bikes
SIZES = %w[Small Medium Large]
# iterates over creating a user and a bike and making the relation between the two
10.times do
  user = User.new(email: Faker::Internet.email, password: rand(100_000..999_999),
              first_name: Faker::BreakingBad.character, address: Faker::Address.full_address)
  bike = Bike.new(kind: KINDS.sample, brand: Faker::Esport.team, location: Faker::Address.full_address,
                 size: SIZES.sample, price: rand(10..25))
  user.save
  bike.user = user
  bike.save
end
