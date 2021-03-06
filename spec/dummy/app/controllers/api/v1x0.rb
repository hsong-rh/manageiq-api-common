module Api
  module V1x0
    class AuthenticationsController < ApplicationController
      def create
        render :json => "OK".to_json
      end
    end

    class RootController < ApplicationController
      def openapi
        render :json => {:things => "stuff"}.to_json
      end
    end

    class VmsController < ApplicationController
      def index
        render :json => {:things => "stuff"}.to_json
      end

      def show
        render :json => {:id => request_path_parts["primary_collection_id"]}.to_json
      end
    end

    class PersonsController < ApplicationController
      def create
        params_for_create
        render :json => "OK".to_json
      end

      def update
        params_for_update
        render :json => "OK".to_json
      end

      def index
        safe_params_for_list
        render :json => {:things => "stuff"}.to_json
      end
    end

    class ExtrasController < ApplicationController
      self.openapi_enabled = false
      rescue_from(ArgumentError) do |exception|
        error_document = ManageIQ::API::Common::ErrorDocument.new.add(400, exception.message)
        render :json => error_document.to_h, :status => error_document.status
      end

      def index
        safe_params_for_list
        render :json => "OK".to_json
      end
    end

    class GraphqlController < Api::V1::GraphqlController; end
  end
end
