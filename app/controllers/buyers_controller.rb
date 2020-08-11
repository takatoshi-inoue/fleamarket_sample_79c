class BuyersController < ApplicationController
  require 'payjp'
  before_action :set_card, :set_post

  def index
    if @card.blank?
      redirect_to new_card_path
    else
      Payjp.api_key = Rails.application.credentials.payjp[:secret_key]
      customer = Payjp::Customer.retrieve(@card.customer_id) 
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end

  def pay
    Payjp.api_key = Rails.application.credentials.payjp[:secret_key]
    Payjp::Charge.create(
      :amount => @post.price, 
      :customer => @card.customer_id, 
      :currency => 'jpy', 
    )
    redirect_to done_post_buyers_path
  end

  def done
    @post_buyer = Post.find(params[:post_id])
    @post_buyer.update(buyer_id: current_user.id)
  end

  private

  def set_card
    @card = Card.find_by(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

end