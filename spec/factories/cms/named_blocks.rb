# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :named_block, class: 'Cms::Models::Named::Block' do
    name { Faker::Lorem.characters(10) }
  end
end
