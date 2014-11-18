class ChargesController < ApplicationController

	def index
	end
	def new 
	end
	def create
		# Set your secret key: remember to change this to your live secret key in production
		# See your keys here https://dashboard.stripe.com/account
		Stripe.api_key = "sk_test_pwbtG5aDcpDzZyHUJLzyxVAu"

		# Get the credit card details submitted by the form
		stripe_card_token = params[:stripeToken]

		# Create a Customer
		customer = Stripe::Customer.create(
		  :card => token,
		  :description => "payinguser@example.com"
		)

		# Charge the Customer instead of the card
		Stripe::Charge.create(
		    :amount => 1000, # incents
		    :currency => "usd",
		    :customer => customer.id
		)

		# Save the customer ID in your database so you can use it later
		save_stripe_customer_id(User.find(params[:user]), customer.id)

		# Later...
		customer_id = get_stripe_customer_id(user)

		Stripe::Charge.create(
		  :amount   => 1500, # $15.00 this time
		  :currency => "usd",
		  :customer => customer_id
		)
	end
	def edit 
	end
	def update
	end
	def destroy
	end
# # Set your secret key: remember to change this to your live secret key in production
# # See your keys here https://dashboard.stripe.com/account
# Stripe.api_key = "sk_test_pwbtG5aDcpDzZyHUJLzyxVAu"

# # Get the credit card details submitted by the form
# token = params[:stripeToken]

# # Create a Customer
# customer = Stripe::Customer.create(
#   :card => token,
#   :description => "payinguser@example.com"
# )

# # Charge the Customer instead of the card
# Stripe::Charge.create(
#     :amount => 1000, # incents
#     :currency => "usd",
#     :customer => customer.id
# )

# # Save the customer ID in your database so you can use it later
# save_stripe_customer_id(user, customer.id)

# # Later...
# customer_id = get_stripe_customer_id(user)

# Stripe::Charge.create(
#   :amount   => 1500, # $15.00 this time
#   :currency => "usd",
#   :customer => customer_id
# )
end


	# def new
	# end

	# def create
	#   # Amount is in in cents
	#   # if current_user

	#   @amount = 500

	# 	customer = Stripe::Customer.create(
	# 	  :email => 'example@stripe.com',
	# 	  :card  => params[:stripeToken]
	# 	)


	#   charge = Stripe::Charge.create(
	#     :customer    => customer.id,
	#     :amount      => @amount,
	#     :description => 'Rails Stripe customer',
	#     :currency    => 'usd'
	#   )

	# rescue Stripe::CardError => e
	#   flash[:error] = e.message
	#   redirect_to charges_path
	# end