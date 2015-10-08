FactoryGirl.define do
  factory :image, class: "Cms::Models::Image" do
    name { Faker::Lorem.characters(10) }
    title { Faker::Name.name }
    content { Faker::Lorem.paragraph(10) }
    categories { Faker::Lorem.words(2) }
    tags { Faker::Lorem.words(2) }
    description { Faker::Lorem.sentence }
    position { 1 }
    img_content { File.new(File.join('spec', 'fixtures', 'ruby.png'), 'r')  }
  end
end
