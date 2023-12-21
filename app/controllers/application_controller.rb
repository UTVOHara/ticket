class ApplicationController < ActionController::Base
  before_action :set_render_cart
  before_action :initialize_cart
  before_action :configure_permitted_parameters, if: :devise_controller?

  def set_render_cart
    @render_cart = true
  end

  def initialize_cart
    if current_user
      @cart = current_user.cart || current_user.create_cart
    elsif session[:cart_id] && Cart.exists?(session[:cart_id])
      @cart = Cart.find(session[:cart_id])
    else
      return unless @cart.nil?

      @cart = Cart.create
      session[:cart_id] = @cart.id
    end
  end

  def update
    cookies[:theme] = params[:theme]
    redirect_to(request.referrer || root_path)
  end

  protected

  def user_not_authorized
    flash[:alert] = 'Упс Ошибка'
    redirect_to root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name age photo])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[first_name last_name age photo])
  end
end
