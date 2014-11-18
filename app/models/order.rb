class Order < ActiveRecord::Base
    
    belongs_to :user
    belongs_to :admin
	has_many :product_orders
	has_many :products, through: :product_orders

	attr_accessor :stripe_card_token

	def save_with_payment
	  if valid?
	    customer = Stripe::Customer.create(description: email, card: stripe_card_token)
	    self.stripe_customer_token = customer.id
	    save!
	  end
	rescue Stripe::InvalidRequestError => e
	  logger.error "Stripe error while creating customer: #{e.message}"
	  errors.add :base, "There was a problem with your credit card."
	  false
	end
end
    # t.integer  "product_id"
    # t.integer  "user_id"
    # t.integer  "admin_id"
    # t.datetime "created_at"
    # t.datetime "updated_at"
    # t.string   "stripe_customer_token"
    # t.string   "email"

    	# Set your secret key: remember to change this to your live secret key in production
		# See your keys here https://dashboard.stripe.com/account
		# Stripe.api_key = "sk_test_pwbtG5aDcpDzZyHUJLzyxVAu"

		# # Get the credit card details submitted by the form
		# token = params[:stripeToken]