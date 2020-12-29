FactoryBot.create(:user, :admin, password: '123456')
puts 'User added'

users = FactoryBot.create_list(:user, 10, password: '123456')
puts 'Admin added'

users.each do |user|
  FactoryBot.create_list(:organization, 0..3, author: user)
end
puts 'Organizations added'
