namespace :swagger do
  task :generate_docs do
    sh 'rake rswag:specs:swaggerize PATTERN="spec/swagger/**/*_spec.rb"'
  end
end
