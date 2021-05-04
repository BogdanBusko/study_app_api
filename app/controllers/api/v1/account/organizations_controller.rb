class Api::V1::Account::OrganizationsController < Api::V1::Account::AccountController
  def index
    organizations = current_user.organizations

    render json: OrganizationSerializer.new(organizations), status: 200
  end

  def create
    organization = current_user.own_organizations.build(organization_params)

    if organization.save
      render json: OrganizationSerializer.new(organization), status: 201
    else
      render json: ErrorsSerializer.new(organization), status: 422
    end
  end

  private

  def organization_params
    params.require(:organization).permit(:name)
  end
end
