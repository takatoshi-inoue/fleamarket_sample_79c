FactoryBot.define do
  factory :image do
    name   {File.open("#{Rails.root}/spec/fixtures/BABA.jpg")}
    post
    # user
    # association :post  post_id
  end
end
