FactoryBot.define do
  factory :card do
    customer_id    {"tes_2222222222222222222222222222"}
    card_id        {"tes_1111111111111111111111111111"}

    association :user
  end
end
