FactoryBot.define do

  factory :post do
    id               {77}
    name             {"bbbbb"}
    text             {"bbbbbbbbbbb"}
    burden           {1}
    area             {1}
    day              {1}
    price            {"99999"}
    brand            {"GUCCI"}
    condition        {1}
    user_id          {77}
    association :user
    # images  { FactoryBot.build(:image, post: post) }
    
    after(:build) do |post|
      post.images << FactoryBot.build(:image, post: post)
    end  

    trait :image0_post do
      after(:build) do |post|
      end 
    end


    trait :image2_post do
      after(:build) do |post|
        post.images << FactoryBot.build(:image, post: post)
        post.images << FactoryBot.build(:image, post: post)
      end 
    end

    trait :image5_post do
      after(:build) do |post|
        post.images << FactoryBot.build(:image, post: post)
        post.images << FactoryBot.build(:image, post: post)
        post.images << FactoryBot.build(:image, post: post)
        post.images << FactoryBot.build(:image, post: post)
      end 
    end

    trait :image6_post do
      after(:build) do |post|
        post.images << FactoryBot.build(:image, post: post)
        post.images << FactoryBot.build(:image, post: post)
        post.images << FactoryBot.build(:image, post: post)
        post.images << FactoryBot.build(:image, post: post)
        post.images << FactoryBot.build(:image, post: post)
        post.images << FactoryBot.build(:image, post: post)
      end 
    end
  end
end
