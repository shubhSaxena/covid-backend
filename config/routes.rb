Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :country_stat do
    post 'active_cases', on: :collection
    post 'total_deaths', on: :collection
  end
end
