Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'calculators#calculator'
  post 'calculate',               to: 'calculators#calculate'
end
