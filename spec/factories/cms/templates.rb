FactoryGirl.define do
  factory :template, class: 'Cms::Models::Template' do
    name { Faker::Name.name }
    template { Faker::Lorem.paragraph(10) }
    
    factory :layout do
      type { 'layout'}
    end
  end
end
