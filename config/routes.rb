Rails.application.routes.draw do
  get "/login" , to: "persons#login"
end
