class LeasesController < ApplicationController
    def create
        render json: Lease.create!(lease_params), status: :created
    end

    def delete
        Lease.find(params[:id]).destroy
    end

    private

    def lease_params
        params.permit(:rent)
    end
end
