# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :menu, class: "Cms::Models::Menu" do
    name { Faker::Lorem.characters(10) }
  end
end
