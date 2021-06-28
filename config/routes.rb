Rails.application.routes.draw do
  devise_for :users
  scope '/api' do
    resources :tarefas
  end
end
