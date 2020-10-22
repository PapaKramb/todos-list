Rails.application.routes.draw do
  root 'projects#index'
  resources :projects, :todos do
    resources :todos
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
