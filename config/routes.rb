Rails.application.routes.draw do
  resources :questions do
    collection do
      put :hide
    end
  end

  # put '/questions/:id/hide', to: 'questions#hide'
  root to: 'questions#index'
end
