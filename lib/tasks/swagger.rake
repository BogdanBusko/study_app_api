namespace :swagger do
  task :generate_docs do
    sh 'rake rswag:specs:swaggerize PATTERN="spec/swagger/**/*_doc.rb"'
  end
end
