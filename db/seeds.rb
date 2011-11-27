# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Department.delete_all
Position.delete_all
User.delete_all
Activity.delete_all

puts "Create departments..."
rand(10) + 1

a = Department.create!(:name => "Administration")
d = Department.create!(:name => "Development")
t = Department.create!(:name => "Testing")

# Positions of Administration department
ceo = Position.create!(:name => "Command executive officer", :department => a)

# Positions of Development department
pm = Position.create!(:name => "Project manager", :department => d, :manager => ceo)
tl = Position.create!(:name => "Team lead", :department => d, :manager => pm)
se = Position.create!(:name => "Software engineer", :department => d, :manager => pm)

# Positions of Testing department
ttl = Position.create!(:name => "Testing team lead", :department => t, :manager => ceo)
t = Position.create!(:name => "Tester", :department => t, :manager => ttl)

# Users
user_ceo = User.create!(:email => "ceo@ceo.com", :password => "ceo@ceo.com", :first_name => "ceo", :last_name => "ceo", :role => "admin", :position => ceo)
user_pm = User.create!(:email => "pm1@pm1.com", :password => "pm1@pm1.com", :first_name => "pm1", :last_name => "pm1", :role => "manager", :position => pm)
user_tl = User.create!(:email => "tl@tl.com", :password => "tl@tl.com", :first_name => "tl", :last_name => "tl", :role => "employee", :position => tl)

# User's treatment
tr1 = Treatment.create!(:title => "hello!", :content => "hello, dear manager!", :user_to => user_pm, :user_from => user_tl)
