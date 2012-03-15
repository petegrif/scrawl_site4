FactoryGirl.define do
  factory :user do
    name     "Peter Griffiths"
    email    "petegrif@myscrawl.com"
    password "foobar"
    password_confirmation "foobar"
  end
end