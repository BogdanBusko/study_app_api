require 'rails_helper'

RSpec.describe 'Factories' do
  FactoryBot.factories.instance_variable_get('@items').keys.each do |factory|
    it 'is valid' do
      expect(build(factory.to_sym)).to be_valid
    end
  end
end
