Factory.define :user do |user|
  user.name                  "Michael Hartl"
  user.mail                 "mhartl@example.com"
  user.password              "foobar"
  user.password_confirmation "foobar"
end

Factory.sequence :mail do |n|
  "person-#{n}@example.com"
end

