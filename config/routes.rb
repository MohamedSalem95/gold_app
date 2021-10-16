Rails.application.routes.draw do
  resources :products
  resources :categories
  get 'categories/:id/confirm', to: 'categories#confirm', as: 'confirm_category'
  get 'welcome/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
