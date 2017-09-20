Rails.application.routes.draw do
  root to: "questions#show"
  resource :question, only: [:show]

  resources :questions do
    resources :responses, only: [:show, :create]
  end
end
