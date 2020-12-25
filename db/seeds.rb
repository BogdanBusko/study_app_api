FactoryBot.create(:user, :admin, password: '123456')
puts 'User added'
FactoryBot.create(:user, password: '123456')
puts 'Admin added'
