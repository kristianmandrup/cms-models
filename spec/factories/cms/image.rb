FactoryGirl.define do
  factory :image, class: "Cms::Models::Image" do
    name { Faker::Name.name }
    title { Faker::Name.name }
    #metainfo
    description {Faker::Lorem.paragraph(2)}
    categories {Faker::Lorem.words(4) }
    tags { Faker::Lorem.words(4) }
  end
end
