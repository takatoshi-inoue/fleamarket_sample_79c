require 'rails_helper'
describe User do
  describe '#create' do

    it "is invalid without nickname" do
      user = User.new(nickname: "", email: "", password: "", password_confirmation: "", first_name:"", last_name:"", first_name_kana:"", last_name_kana:"", birth_year:"", birth_month:"", birth_day:"", phone_number:"" )
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    it "is invalid without email" do
      user = User.new(nickname: "", email: "", password: "", password_confirmation: "", first_name:"", last_name:"", first_name_kana:"", last_name_kana:"", birth_year:"", birth_month:"", birth_day:"", phone_number:"" )
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "is invalid without password" do
      user = User.new(nickname: "", email: "", password: "", password_confirmation: "", first_name:"", last_name:"", first_name_kana:"", last_name_kana:"", birth_year:"", birth_month:"", birth_day:"", phone_number:"" )
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "is invalid without password_confirmation" do
      user = User.new(nickname: "", email: "", password: "", password_confirmation: "", first_name:"", last_name:"", first_name_kana:"", last_name_kana:"", birth_year:"", birth_month:"", birth_day:"", phone_number:"" )
      user.valid?
      expect(user.errors[:password_confirmation]).to include()
    end

    it "is invalid without first_name" do
      user = User.new(nickname: "", email: "", password: "", password_confirmation: "", first_name:"", last_name:"", first_name_kana:"", last_name_kana:"", birth_year:"", birth_month:"", birth_day:"", phone_number:"" )
      user.valid?
      expect(user.errors[:first_name]).to include("を入力してください")
    end

    it "is invalid without last_name" do
      user = User.new(nickname: "", email: "", password: "", password_confirmation: "", first_name:"", last_name:"", first_name_kana:"", last_name_kana:"", birth_year:"", birth_month:"", birth_day:"", phone_number:"" )
      user.valid?
      expect(user.errors[:last_name]).to include("を入力してください")
    end

    it "is invalid without first_name_kana" do
      user = User.new(nickname: "", email: "", password: "", password_confirmation: "", first_name:"", last_name:"", first_name_kana:"", last_name_kana:"", birth_year:"", birth_month:"", birth_day:"", phone_number:"" )
      user.valid?
      expect(user.errors[:first_name_kana]).to include("を入力してください")
    end

    it "is invalid without last_name_kana" do
      user = User.new(nickname: "", email: "", password: "", password_confirmation: "", first_name:"", last_name:"", first_name_kana:"", last_name_kana:"", birth_year:"", birth_month:"", birth_day:"", phone_number:"" )
      user.valid?
      expect(user.errors[:last_name_kana]).to include("を入力してください")
    end

    it "is invalid without birth_year" do
      user = User.new(nickname: "", email: "", password: "", password_confirmation: "", first_name:"", last_name:"", first_name_kana:"", last_name_kana:"", birth_year:"", birth_month:"", birth_day:"", phone_number:"" )
      user.valid?
      expect(user.errors[:birth_year]).to include("を入力してください")
    end

    it "is invalid without birth_month" do
      user = User.new(nickname: "", email: "", password: "", password_confirmation: "", first_name:"", last_name:"", first_name_kana:"", last_name_kana:"", birth_year:"", birth_month:"", birth_day:"", phone_number:"" )
      user.valid?
      expect(user.errors[:birth_month]).to include("を入力してください")
    end

    it "is invalid without birth_day" do
      user = User.new(nickname: "", email: "", password: "", password_confirmation: "", first_name:"", last_name:"", first_name_kana:"", last_name_kana:"", birth_year:"", birth_month:"", birth_day:"", phone_number:"" )
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end
  end
end