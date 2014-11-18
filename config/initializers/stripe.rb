Rails.configuration.stripe = {
  :publishable_key => ENV['pk_test_EKV3FJqqdIrGBZhv2d7fR7RZ'],
  :secret_key      => ENV['sk_test_pwbtG5aDcpDzZyHUJLzyxVAu']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]


