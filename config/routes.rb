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

  match '/404' => 'errors#not_found',             via: :all, as: :not_found
  match '/422' => 'errors#unprocessable_entity',  via: :all, as: :unprocessable_entity
  match '/500' => 'errors#internal_server_error', via: :all, as: :internal_server_error
end
