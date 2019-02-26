Rails.application.routes.draw do
  root to: "welcome#index"

  namespace :api do
    namespace :v1 do
      get "/daily_pet", to: "pets#show", :id => "random"
    end
  end

end
