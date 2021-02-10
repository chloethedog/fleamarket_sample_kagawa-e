FactoryBot.define do

  factory :item do
    name                   {"item"}
    price                  {1000}
    purchase               {1}
    explanation            {"説明文"}
    state_id               {1}
    brand                  {"クロユニ"}
    delivery_fee_id        {1}
    delivery_area_id       {1}
    delivery_method_id     {1}
    shipment_date_id       {1}


    association :seller, factory: :user
    association :buyer, factory: :user
    association :category

    after(:build) do |item|
      item.item_photo = FactoryBot.build(:item_photo, item: item)
    end
  end
end