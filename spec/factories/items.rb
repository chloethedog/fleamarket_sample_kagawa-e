FactoryBot.define do

  factory :item do
    name                   {"item"}
    seller_id              { FactoryBot.create(:user)}
    price                  {1000}
    purchase               {"1"}
    purchase_id            { FactoryBot.create(:user)}
    explanation            {"説明文"}
    category_id            {1}
    state_id               {1}
    brand                  {"クロユニ"}
    delivery_fee_id        {1}
    delivery_area_id       {1}
    delivery_method_id     {1}
    shipment_date_id       {1}

    # association :item_photo
    association :user
    # association :category
    
    # after(:build) do |item|
    #   item << build(:item_photo)
    # end
  end
end