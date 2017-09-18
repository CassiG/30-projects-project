require 'faker'

FactoryGirl.define do
  factory :post do |f|
    f.title { Faker::HarryPotter.book }
    f.body { Faker::Hipster.paragraph(2) }
  end
end
