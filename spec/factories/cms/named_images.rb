# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :named_image, class: 'Cms::Models::Named::Image' do
    name { Faker::Lorem.characters(10) }
  end
end
