Rails.application.routes.draw do

  root 'tests#index'

  get :signup, to: 'users#new'

  resources :users, only: %i[create]

  resources :tests do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: :index
    end

    post :start, on: :member
  end

  resources :test_passages, only: %i[show update] do
    get :result, on: :member
  end
end
