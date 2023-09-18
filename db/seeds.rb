# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Region.create!({
  name: "middle_east_asia",
  title: "中東アジア",
  description: "",
  map_url: "",
})

Country.create!({
  name: "saudi_arabia",
  title: "サウジアラビア",
  description: "",
  region_id: 1,
  map_url: "",
})

City.create!({
  name: "riyadh",
  title: "リヤド",
  description: "",
  country_id: 1,
  map_url: ""
})

Category.create!({
  name: "blog",
  title: "ブログ",
  description: ""
})

Post.create!({
  title: "test",
  body: "test",
  country_id: 1,
  city_id: 1,
  category_id: 1,
  user_id: 1
})
