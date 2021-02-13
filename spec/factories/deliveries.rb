FactoryBot.define do

  factory :delivery do
    postal_code {"7600019"}
    prefectures_id {"1"}
    municipality {"高松市"}
    address {"サンポート2-1"}
    address_detail {"高松シンボルタワー タワー棟4・5階"}
    phone_number {"087-822-0111"}

    association :user
  end

end