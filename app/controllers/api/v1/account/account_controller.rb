class Api::V1::Account::AccountController < Api::V1::BaseController
  before_action :authenticate_user!
end
