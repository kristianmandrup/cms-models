FactoryGirl.define do
  factory :image_list, class: "Cms::Models::Image::List" do
    name { Faker::Lorem.characters(10) }
  end
end
