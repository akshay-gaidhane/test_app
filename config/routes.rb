Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homes#index'
  post '/homes/inbound_sms', to: 'homes#inbound_sms', as: 'inbound_sms'
  post '/homes/outbound_sms', to: 'homes#outbound_sms', as: 'outbound_sms'
end
