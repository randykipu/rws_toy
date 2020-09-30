Rails.application.routes.draw do
  get 'websocket/index'

  get 'websocket/index'

  root 'welcome#index'
  get 'websocket', to: 'websocket#index'
end
