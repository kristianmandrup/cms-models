FactoryGirl.define do
  factory :component, class: "Cms::Models::Component" do
    name { Faker::Lorem.characters(10) }
  end
end
