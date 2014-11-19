Rails.application.routes.draw do

  resources :invoices
  resources :line_items

  root to: "invoices#index"

end
