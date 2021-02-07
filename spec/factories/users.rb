FactoryBot.define do

  factory :user do
    id                              {"1"}
    nickname                        {"yama"}
    email                           {"zell8130@outlook.jp"}
    password                        {"test0000"}
    password_confirmation           {"test0000"}
    birthday                        {"1998-03-18"}
    last_name                       {"山下"}
    first_name                      {"達也"}
    last_name_ruby                  {"やました"}
    first_name_ruby                 {"たつや"}
  end

end