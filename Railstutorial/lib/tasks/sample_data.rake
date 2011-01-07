require 'faker'

namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    admin = User.create!(:name => "Example User",
                         :mail => "example@railstutorial.org",
                         :password => "foobar",
                         :password_confirmation => "foobar")
    admin.toggle!(:admin)
    99.times do |n|
      name  = Faker::Name.name
      mail = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(:name => name,
                   :mail => mail,
                   :password => password,
                   :password_confirmation => password)
    end
  end
end
