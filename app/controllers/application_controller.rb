class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_categories

  # before_filter :cors_preflight_check
  # after_filter :cors_set_access_control_headers



  protected

    def authenticate_user!
      unless current_user
        redirect_to login_path, :notice => 'You must log in to access this page.'

      end
    end

    def authorize_user!
      unless current_user.id == 1
        redirect_to root_path, :notice => 'Sorry. You cannot access this page. Try again in a century.'

      end
    end



  private

      def current_user
        @current_user ||= User.find_by(id: session[:user_id])
      end

      helper_method :current_user

      def set_categories
        @categories = Category.all
      end




    # # For all responses in this controller, return the CORS access control headers.
    #
    # def cors_set_access_control_headers
    #   headers['Access-Control-Allow-Origin'] = '*'
    #   headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
    #   headers['Access-Control-Max-Age'] = "1728000"
    # end
    #
    # # If this is a preflight OPTIONS request, then short-circuit the
    # # request, return only the necessary headers and return an empty
    # # text/plain.
    #
    # def cors_preflight_check
    #   if request.method == :options
    #     headers['Access-Control-Allow-Origin'] = '*'
    #     headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
    #     headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-Prototype-Version'
    #     headers['Access-Control-Max-Age'] = '1728000'
    #     render :text => '', :content_type => 'text/plain'
    #   end
    # end

end
