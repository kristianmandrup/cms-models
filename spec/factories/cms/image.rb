FactoryGirl.define do
  factory :image, class: "Cms::Models::Image" do
    ##uniquely named
    #name { Faker::Name.name }
    
    #title { Faker::Name.name }
    
    ##metainfo
    #description {}
    #categories {}
    #tags {}
    
    #position { 0 }
    #img_content { Rack::Test::UploadedFile.new(File.join(Rails.root, 'public', 'a2.jpg')) }
  end
end
