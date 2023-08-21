# app/controllers/api/v1/devices_controller.rb

module Api
  module V1
    class DevicesController < ApplicationController

      # POST /devices/:id/keys
      def create_key
        result = AddKeyToDevice.call(params[:id], key_params)

        if result.success?
          render json: result.key, status: :created 
        else
          render json: { errors: result.errors }, status: :unprocessable_entity
        end
      end

      # GET /devices/:id/keys
      def list_keys
        keys = ListKeysForDevice.call(params[:id], page: params[:page])
        
        render json: keys
      end

      # PUT /devices/:id/keys/:key_id
      def invalidate_key
        result = InvalidateKey.call(params[:id], params[:key_id])
        
        if result.success?
          head :no_content
        else
          render json: { errors: result.errors }, status: :unprocessable_entity 
        end
      end

      private

      def key_params
        params.require(:key).permit(:code)  
      end

    end
  end
end