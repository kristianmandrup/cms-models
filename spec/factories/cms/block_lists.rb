FactoryGirl.define do
  factory :block_list, class: "Cms::Models::Block::List" do
    name { Faker::Lorem.characters(10) }
  end
end
