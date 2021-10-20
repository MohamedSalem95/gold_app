Rails.application.routes.draw do
  
  # root path
  root to: 'products#home', as: 'root'
  
  resources :categories do
    resources :sub_categories
    resources :products do
      resources :images
    end
  end
  get 'products', to: 'products#list', as: 'products'
  get 'products/:id/show_customer', to: 'products#show_customer', as: 'product'
  get 'categories/:id/confirm', to: 'categories#confirm', as: 'confirm_category'
  get 'categories/:category_id/products/:product_id/images/:id/confirm', to: 'images#confirm', as: 'confirm_category_product_image'
  get 'categories/:category_id/sub_categories/:id/confirm', to: 'sub_categories#confirm', as: 'confirm_category_sub_category'
  get 'welcome/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
