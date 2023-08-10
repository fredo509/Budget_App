Rails.application.routes.draw do
  Rails.application.routes.draw do
  root "home_page#index"
  resources :categories, do
    resources :transactions, only: [:new, :create]
  end
end
