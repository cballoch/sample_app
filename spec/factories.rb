 # By using the symbol ":user", we get Factory Girl to simulate the User model.
 
Factory.define :user do |user|
   user.name                  "Caleb Balloch"
   user.email                 "caleb.balloch@gmail.com"
   user.password              "El tigre"
   user.password_confirmation "El tigre"
 end
 
 Factory.sequence :email do |n|
   "person-#{n}@example.com"
 end
 
 Factory.define :micropost do |micropost|
   micropost.content "Johnny be-good"
   micropost.association :user
 end