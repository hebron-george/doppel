Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :tax_forms, only: [:upload_form]
  post 'tax_form/upload_form'
  get 'hello-world', to: 'application#hello_world'
end
