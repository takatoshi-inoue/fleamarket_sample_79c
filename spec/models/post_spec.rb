require 'rails_helper'

describe Post do
  describe '#create' do

    it "is invalid without name" do
      post = FactoryBot.build(:post, name: nil)
      post.valid?
      expect(post.errors[:name]).to include("を入力してください")
    end

    it "is invalid without text" do
      post = FactoryBot.build(:post, text: nil)
      post.valid?
      expect(post.errors[:text]).to include("を入力してください")
    end

    it "is invalid without condition" do
      post = FactoryBot.build(:post, condition: nil)
      post.valid?
      expect(post.errors[:condition]).to include("を入力してください")
    end

    it "is invalid without burden" do
      post = FactoryBot.build(:post, burden: nil)
      post.valid?
      expect(post.errors[:burden]).to include("を入力してください")
    end

    it "is invalid without area" do
      post = FactoryBot.build(:post, area: nil)
      post.valid?
      expect(post.errors[:area]).to include("を入力してください")
    end

    it "is invalid without day" do
      post = FactoryBot.build(:post, day: nil)
      post.valid?
      expect(post.errors[:day]).to include("を入力してください")
    end

    it "is invalid without price" do
      post = FactoryBot.build(:post, price: nil)
      post.valid?
      expect(post.errors[:price]).to include("を入力してください")
    end

    it "写真なしはNG" do
      post = FactoryBot.build(:post, :image0_post)
      post.valid?
      expect(post.errors[:images]).to include()
    end

    it "写真1枚なら有効" do
      user = FactoryBot.create(:user)
      post = FactoryBot.build(:post,user_id: user[:id])
      expect(post).to be_valid
    end

    it "写真5枚なら有効" do
      user = FactoryBot.create(:user)
      post = FactoryBot.build(:post, :image5_post, user_id: user[:id])
      expect(post).to be_valid
    end

    it "写真6枚ならNG" do
      post = FactoryBot.build(:post, :image6_post)
      post.valid?
      expect(post.errors[:images]).to include()
    end
  end
end
