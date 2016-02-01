class ChargesController < ApplicationController
  def create
    @amount = 10_00
    #Create a Stripe Customer object for associating with the charge
    customer = Stripe::Customer.create(
      email: current_user.email,
      card: params[:stripeToken]
      )

    #Stripe hocus pocus
    charge = Stripe::Charge.create(
      customer: customer.id, #not the user_id
      amount: @amount,
      description: "Premium Membership - #{current_user.email}",
      currency: 'usd'
      )

    flash[:notice] = "Thank you for upgrading, #{current_user.email}! Feel free to tell your friends."
    redirect_to root_url

  rescue Stripe::CardError => e
    flash.now[:alert] = e.message
    redirect_to new_charge_path
  end

  def new
    @amount = 10_00
    @stripe_btn_data = {
      key: "#{ Rails.configuration.stripe[:publishable_key] }",
      description: "Premium Membership - #{current_user.name}",
      amount: @amount
    }
  end
end
