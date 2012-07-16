TaskCommunity::Application.routes.draw do

  devise_for :users

  resources :home, :only => :index
  #resources :lists

  resources :watches, :only => [:index, :destroy] do
	  get 'add',:on => :member
	end

  resources :users, :only => :show do
    resources :lists, :controller => "users/lists"
  end

  root :to => "home#index"

end
