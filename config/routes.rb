Rails.application.routes.draw do
  resources :questions do
    member do
      put :hide
    end
  end
  resource :session, only: %i[new create destroy]
  resources :users, except: :index, param: :nickname
  resources :hashtags, only: :show, param: :body

  root to: 'questions#index'
end
