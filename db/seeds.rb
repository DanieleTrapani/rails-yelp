puts 'Resetting Database...'
Restaurant.destroy_all

puts 'Creating seeds...'
5.times do
  # generate restaurants and reviews
  categories = %w[chinese italian japanese french belgian]
  rest_params = {
    name: Faker::Restaurant.name,
    category: categories.sample,
    address: Faker::Address.street_address,
    phone_number: Faker::PhoneNumber.cell_phone
  }
  restaurant = Restaurant.new(rest_params)
  5.times do
    rev_params = {
      rating: rand(0..5),
      content: Faker::Restaurant.review
    }
    review = Review.create(rev_params)
    p review
    restaurant.reviews << review
  end
  restaurant.save
end

puts 'Done!'
