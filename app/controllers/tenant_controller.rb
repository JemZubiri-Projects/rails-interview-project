class TenantController < ApplicationController
    before_action :valid_tenant

    def show
        @current_tenant.increment!(:no_of_request, 1)
        @user = User.find params[:id]
    end
end