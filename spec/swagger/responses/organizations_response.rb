module SwaggerResponses
  def organizations_response
    {
      data: [
        {
          id: '1',
          type: 'organization',
          attributes: {
            id: 1,
            name: 'Organization name'
          }
        },
        {
          id: '2',
          type: 'organization',
          attributes: {
            id: 2,
            name: 'Organization name'
          }
        }
      ]
    }
  end
end
