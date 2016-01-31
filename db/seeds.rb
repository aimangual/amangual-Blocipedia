require 'faker'

# Create an admin user
admin = User.new(
 name:     'Admin User',
 email:    'admin@example.com',
 password: 'helloworld',
 role:     'admin'
)
admin.skip_confirmation!
admin.save!

# Create a moderator
moderator = User.new(
 name:     'Moderator User',
 email:    'moderator@example.com',
 password: 'helloworld',
 role:     'moderator'
)
moderator.skip_confirmation!
moderator.save!

# Create a member
member = User.new(
 name:     'Member User',
 email:    'member@example.com',
 password: 'helloworld'
)
member.skip_confirmation!
member.save!

# Create Wikis
50.times do
 Wiki.create!(
   title:  Faker::Lorem.sentence,
   body:   Faker::Lorem.paragraph
 )
end
wikis = Wiki.all

puts "Seed finished"
puts "#{Wiki.count} wikis created"