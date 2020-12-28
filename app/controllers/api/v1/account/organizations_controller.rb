class Api::V1::Account::OrganizationsController < Api::V1::Account::AccountController
  def create
    organization = current_user.own_organizations.build(organization_params)

    if organization.save
      head(:no_content)
    else
      render json: ErrorsSerializer.new(organization), status: 422
    end
  end

  private

  def organization_params
    params.require(:organization).permit(:name)
  end
end
