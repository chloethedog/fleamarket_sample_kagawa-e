FactoryBot.define do

  factory :item_photo do
    thumbnail         {File.open("#{Rails.root}/public/images/test_image.jpg")}
    item              {"1"}

  end
end