FactoryBot.define do

  factory :user do
    id                              {"1"}
    nickname                        {"yama"}
    profile                         {"test"}
    email                           {"zell8130@outlook.jp"}
    password                        {"test0000"}
    password_confirmation           {"test0000"}
    birthday                        {"1998-03-18"}
    last_name                       {"試験"}
    first_name                      {"試験"}
    last_name_ruby                  {"しけん"}
    first_name_ruby                 {"しけん"}
  end

end