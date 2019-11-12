Rails.application.routes.draw do
 root 'books#top'
 get 'top' => 'books#top'
 get 'error_message' => 'layouts#error_message'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 resources :books
end
