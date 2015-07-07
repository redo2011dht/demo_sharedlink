Rails.application.routes.draw do
  resources :likes
  get 'comments/create'
root 'posts#index'
  get 'comments/destroy'
  resources :magazines do
    resources :ads
 end

  resources :posts do
    	resources :comments
	resources :likes 
  end
  devise_for :users  
end
