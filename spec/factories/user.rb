FactoryBot.define do

  factory :user do
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"0000000"}
    password_confirmation {"0000000"}
    first_name            {"加藤"}
    last_name             {"仁"}
    first_name_kana       {"カトウ"}
    last_name_kana        {"ジン"}
    birth_year            {"1997"}
    birth_month           {"02"}
    birth_day             {"27"}
    phone_number          {"00000000000"}
  end

end