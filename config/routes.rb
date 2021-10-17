Rails.application.routes.draw do
  
  resources :products
  resources :categories do
    resources :sub_categories
  end
  get 'categories/:id/confirm', to: 'categories#confirm', as: 'confirm_category'
  get 'categories/:category_id/sub_categories/:id/confirm', to: 'sub_categories#confirm', as: 'confirm_category_sub_category'
  get 'welcome/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
