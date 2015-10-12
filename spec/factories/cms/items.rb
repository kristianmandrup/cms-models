FactoryGirl.define do
  factory :item, class: "Cms::Models::Menu::Item" do
    label { Faker::Lorem.characters(10) }
    icon { Faker::Name.name }
    link { Faker::Internet.url('example.com') }
  end
end
