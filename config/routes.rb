Rails.application.routes.draw do
  get "/home" , to: "persons#home"
  post "/login", to: "persons#login"
  get "/staff/:id",to: "staff#home"
  get "/students/:id",to: "students#home"
  get "/logout" , to: "persons#logout"
  get "/feedback/:id" , to: "students#feedback"
end
