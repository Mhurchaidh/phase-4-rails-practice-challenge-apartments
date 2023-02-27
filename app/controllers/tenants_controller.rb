class TenantsController < ApplicationController
    def index
        render json: Tenant.all
    end

    def show
        render json: find_tenant
    end

    def create
        tenant = Tenant.create!(tenant_params)
        render json: tenant, status: :created
    end

    def update
        tenant = find_tenant
        tenant.update(tenant_params)
        render json: tenant, status: :accepted
    end

    def delete
        find_tenant.destroy
    end

    private
    def find_tenant
        Tenant.find(params[:id])
    end

    def tenant_params
        params.permit(:age, :name)
    end
end
