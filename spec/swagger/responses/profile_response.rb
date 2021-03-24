module SwaggerResponses
  def profile_response
    {
      data: {
        id: 1,
        type: 'profile',
        attribute: {
          first_name: 'John',
          last_name: 'Doe',
          full_name: 'John Doe',
          email: 'john.doe@email.com'
        }
      }
    }
  end
end
