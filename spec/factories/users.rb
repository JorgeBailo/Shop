#spec/factories/users.rb
FactoryGirl.define do
  factory :user do
    name "jorge"
    lastname "bailo"
    email "jbe@example.com"
    password "pass_1"
    password_confirmation "pass_1"
  end
end