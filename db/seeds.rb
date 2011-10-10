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

# Possible Activities
conference = Activity.create!(:title => "Conference", :details => "Conference about new project")
sport = Activity.create!(:title => "Sport activity", :details => "Sport competitions")
research = Activity.create!(:title => "Research", :details => "Research in computer science")

# Users
user_ceo = User.create!(:email => "ceo@ceo.com", :password => "ceo@ceo.com", :first_name => "ceo", :last_name => "ceo")
user_pm1 = User.create!(:email => "pm1@pm1.com", :password => "pm1@pm1.com", :first_name => "pm1", :last_name => "pm1")
user_tl1 = User.create!(:email => "tl1@tl1.com", :password => "tl1@tl1.com", :first_name => "tl1", :last_name => "tl1")
user_ttl = User.create!(:email => "ttl@ttl.com", :password => "ttl@ttl.com", :first_name => "ttl@ttl.com", :last_name => "ttl@ttl.com")

# User's treatment
tr1 = Treatment.create!(:title => "hello!", :content => "hello, dear manager!", :user_to => user_pm1, :user_from => user_tl1)
