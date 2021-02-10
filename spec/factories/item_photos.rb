FactoryBot.define do

  factory :item_photo do
    thumbnail         { Rack::Test::UploadedFile.new(File.join(Rails.root, "spec/fixtures/test_image.jpg"), 'image/jpg') }
  end
end