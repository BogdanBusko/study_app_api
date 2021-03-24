module SwaggerResponses
  def error_response_for(endpoint)
    case endpoint
    when :registration
      registration_error_response
    else
      raise ArgumentError
    end
  end

  private

  def errors_template(errors)
    {
      data: {
        id: 1,
        type: 'errors',
        attributes: {
          errors: errors
        }
      }
    }
  end

  def registration_error_response
    errors_template({
      first_name: ['can\'t be blank'],
      last_name: ['can\'t be blank'],
      email: ['can\'t be blank'],
      password: ['can\'t be blank']
    })
  end
end
