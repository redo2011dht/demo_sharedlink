Rails.application.routes.draw do
  resources :likes
  get 'comments/create'

  get 'comments/destroy'

  resources :posts do
    	resources :comments
	resources :likes do
	    collection do
	       get 'like'
	       get 'unlike'
	     end
  	end      
  end
  devise_for :users  
end
