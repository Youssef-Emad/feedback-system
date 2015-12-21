Rails.application.routes.draw do
  get "/home" , to: "persons#home"
  post "/login", to: "persons#login"
  get "/staff/home/:id",to: "staff#home"
  get "/students/home/:id",to: "students#home"
end
