Rails.application.routes.draw do
  devise_for :users
  root "home_page#index"
  resources :categories do
    resources :transactions, only: %i[index new create destroy update]
  end
end
