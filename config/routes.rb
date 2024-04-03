Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'  
  get "up" => "rails/health#show", as: :rails_health_check

  #TODO: Create a nice view form for a flights#index route.
  # root "flights#index"

  # Created a swagger ui for a test.
  root to: redirect('/api-docs')  
  post '/calculate_fuel', to: 'flights#calculate_fuel'
end
