Rails.application.routes.draw do

  root 'welcome#index'
  get 'queue', to: 'queue#index'
end
