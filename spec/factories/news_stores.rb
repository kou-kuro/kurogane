FactoryBot.define do
  factory :news_store do
    title       { Faker::Lorem.sentence }
    url         { Faker::Internet.url }
    description { Faker::Lorem.sentence }
    category    { 'all' }
    urlToImage  { Faker::Internet.url }
  end
end
