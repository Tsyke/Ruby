Rails.application.routes.draw do
  root "home#index"

  get "/", to: "home#index"
  get "/login", to: "authentications#login"
  get "/register", to: "authentications#register"
  # get "/profile", to: "authentications#profile"

  post "login" => "authentications#login"
  post "register" => "authentications#register"
end
