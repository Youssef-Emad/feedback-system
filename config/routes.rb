Rails.application.routes.draw do
  get "/home" , to: "persons#home"
  post "/login", to: "persons#login"
  get "/staff/:id",to: "staff#home"
  get "/students/:id",to: "students#home"
  get "/logout" , to: "persons#logout"
  get "students/:id/feedback/:course_id" , to: "students#feedback"
  get "staff/:id/feedback/:course_id" , to: "staff#feedback"
  post "/feedbackinsert", to: "students#feedback_insert"
end
