Rails.application.routes.draw do

  root 'welcome#index'
  get 'tasks', to: 'task#index'
end
