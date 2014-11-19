class Order < ActiveRecord::Base
    
    belongs_to :product
    belongs_to :order_info
    belongs_to :user
    belongs_to :admin
	has_many :product_orders
	has_many :products, through: :product_orders

	validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
	  validate :product_present
	  validate :order_info_present

	  before_save :finalize

	  def unit_price
	    if persisted?
	      self[:unit_price]
	    else
	      product.price
	    end
	  end

	  def total_price
	    unit_price * quantity
	  end

	private
	  def product_present
	    if product.nil?
	      errors.add(:product, "is not valid or is not active.")
	    end
	  end

	  def order_info_present
	    if order_info.nil?
	      errors.add(:order_info, "is not a valid order_info.")
	    end
	  end

	  def finalize
	    self[:unit_price] = unit_price
	    self[:total_price] = quantity * self[:unit_price]
	  end

	  

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