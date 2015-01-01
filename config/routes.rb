Rails.application.routes.draw do
  devise_scope :user do
    get "/logout" => "devise/sessions#destroy"
  end
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  root 'index#index'

end
