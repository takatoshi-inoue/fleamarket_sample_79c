FactoryBot.define do
  factory :image do
    name   {File.open("#{Rails.root}/spec/fixtures/BABA.jpg")}
    post
  end
end
