Rails.application.routes.draw do
  get "/home" , to: "persons#home"
  post "/login", to: "persons#login"
end
