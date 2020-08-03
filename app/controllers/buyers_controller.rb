class BuyersController < ApplicationController
  require 'payjp'#Payjpの読み込み
  before_action :set_card, :set_post

  def index
    if @card.blank?
      #登録された情報がない場合にカード登録画面に移動
      redirect_to new_card_path
    else
      Payjp.api_key = Rails.application.credentials.payjp[:secret_key]
      #保管した顧客IDでpayjpから情報取得
      customer = Payjp::Customer.retrieve(@card.customer_id) 
      #カード情報表示のためインスタンス変数に代入
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end

  def pay
    Payjp.api_key = Rails.application.credentials.payjp[:secret_key]
    Payjp::Charge.create(
      :amount => @post.price, #支払金額を引っ張ってくる
      :customer => @card.customer_id,  #顧客ID
      :currency => 'jpy',              #日本円
    )
    redirect_to done_post_buyers_path #完了画面に移動
  end

  def done
  end

  private

  def set_card
    @card = Card.find_by(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end