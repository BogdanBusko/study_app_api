module SwaggerResponses
  def user_response
    {
      data: {
        id: 1,
        type: 'user',
        attribute: {
          first_name: 'John',
          last_name: 'Doe',
          full_name: 'John Doe'
        }
      }
    }
  end
end
