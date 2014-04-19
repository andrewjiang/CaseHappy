Rails.configuration.stripe = {
  :publishable_key => 'pk_live_Se8CO7fKMGXFlC1UIEaFwBlI',
  :secret_key      => 'sk_live_9JThJ60VVyR7U9ujOw9xQXty'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]