FactoryBot.define do

  factory :item do
    name                   {"item"}
    seller                 {"売り手"}
    price                  {"1.000"}
    purchase               {"0"}
    explanation            {"説明文"}
    category_id            {"1"}
    stste_id               {"1"}
    delivery_fee_id        {"1"}
    delivery_are_id        {"1"}
    delivery_method_id     {"1"}
    shipment_date_id       {"1"}
  end

end