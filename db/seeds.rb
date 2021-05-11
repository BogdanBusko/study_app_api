FactoryBot.create(:user, :admin, password: '123456')
puts 'Admin added'

users = FactoryBot.create_list(:user, 10, password: '123456')
puts 'Users added'

organizations = []

users.each do |user|
  organizations << FactoryBot.create_list(:organization, rand(0..3), owner: user)
end
puts 'Own Organizations added'

organizations.flatten.each do |organization|
  members = FactoryBot.create_list(:user, rand(1..5))

  members.each do |member|
    FactoryBot.create(:user_organization, user: member, organization: organization)
  end

  puts "Members for organizations added #{organization.name}"
end
