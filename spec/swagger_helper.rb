require 'rails_helper'

Dir[Rails.root.join('spec', 'swagger', 'responses', '*.rb')].sort.each { |f| require f }

RSpec.configure do |config|
  config.extend SwaggerResponses

  config.swagger_root = Rails.root.join('swagger').to_s

  config.swagger_docs = {
    'v1/swagger.yaml' => {
      openapi: '3.0.1',
      info: {
        title: 'API V1',
        version: 'v1'
      },
      paths: {},
      servers: [
        {
          url: 'https://localhost:5000',
          variables: {
            defaultHost: {
              default: 'localhost'
            }
          }
        }
      ]
    }
  }

  config.swagger_format = :yaml
end
