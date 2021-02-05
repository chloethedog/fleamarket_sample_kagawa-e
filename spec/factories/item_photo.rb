FactoryBot.define do

  factory :item_photo do
    thumbnail          {"1"}
    # thumbnail         {" File.open("app/assets/images/339674_s.jpg")"}
    item              {"1"}

  end
end