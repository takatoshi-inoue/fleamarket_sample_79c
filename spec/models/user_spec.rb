require 'rails_helper'
describe User do
  describe '#create' do

    it "is invalid without nickname" do
      user = FactoryBot.build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    it "is invalid without email" do
      user = FactoryBot.build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "is invalid without password" do
      user = FactoryBot.build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "is invalid without password_confirmation" do
      user = FactoryBot.build(:user, password_confirmation: nil)
      user.valid?
      expect(user.errors[:password_confirmation]).to include()
    end

    it "is invalid without first_name" do
      user = FactoryBot.build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("を入力してください")
    end

    it "is invalid without last_name" do
      user = FactoryBot.build(:user, last_name: nil)
      user.valid?
      expect(user.errors[:last_name]).to include("を入力してください")
    end

    it "is invalid without first_name_kana" do
      user = FactoryBot.build(:user, first_name_kana: nil)
      user.valid?
      expect(user.errors[:first_name_kana]).to include("を入力してください")
    end

    it "is invalid without last_name_kana" do
      user = FactoryBot.build(:user, last_name_kana: nil)
      user.valid?
      expect(user.errors[:last_name_kana]).to include("を入力してください")
    end

    it "is invalid without first_name_zenkaku" do
      user = FactoryBot.build(:user, first_name: "aaa")
      user.valid?
      expect(user.errors[:first_name]).to include("は全角で入力してください")
    end

    it "is invalid without last_name_zenkaku" do
      user = FactoryBot.build(:user, last_name: "aaa")
      user.valid?
      expect(user.errors[:last_name]).to include("は全角で入力してください")
    end

    it "is invalid without first_name_kana_zenkaku" do
      user = FactoryBot.build(:user, first_name_kana: "aaa")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("は全角で入力してください")
    end

    it "is invalid without last_name_kana_zenkaku" do
      user = FactoryBot.build(:user, last_name_kana: "aaa")
      user.valid?
      expect(user.errors[:last_name_kana]).to include("は全角で入力してください")
    end

    it "is invalid without birth_year" do
      user = FactoryBot.build(:user, birth_year: nil)
      user.valid?
      expect(user.errors[:birth_year]).to include("を入力してください")
    end

    it "is invalid without birth_month" do
      user = FactoryBot.build(:user, birth_month: nil)
      user.valid?
      expect(user.errors[:birth_month]).to include("を入力してください")
    end

    it "is invalid without birth_day" do
      user = FactoryBot.build(:user, birth_day: nil)
      user.valid?
      expect(user.errors[:birth_day]).to include("を入力してください")
    end
    
  end
end