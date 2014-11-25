Rails.application.routes.draw do

  resources :invoices
  resources :line_items do
    patch :save_all, on: :collection
  end

  root to: "invoices#index"

end
