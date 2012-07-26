class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = "Access denied."
    redirect_to root_path
  end

  rescue_from  ActiveRecord::RecordNotFound do |exception|


  end
  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])

    end
  end

  def current_artikel
    if session[:artikel_id]
      @current_artikel ||= Artikel.find(session[:artikel_id])
    end

  end

  def current_bestellung
    if session[:bestellung_id]
      @current_bestellung ||= Bestellung.find(session[:bestellung_id])
    end
  end

  def artikel_signed_in?
    current_artikel.present?
  end

  def user_signed_in?
    current_user.present?
  end

  def sign_bestellung_in?
    current_bestellung.present?
  end

  def require_login!
    unless user_signed_in?
      redirect_to root_path,
                  alert: "Bitte melden Sie sich zuerst an.!!"
    end
  end

  def require_artikel!
    unless artikel_signed_in?
      redirect_to root_path,
                  alert: "Bitte zuerst eine Speise Karte  waehlen!!"
    end
  end

  def require_bestellung!
    unless  sign_bestellung_in?
      redirect_to artikels_path,
                  alert: "Bitte zuerst eine Bestellung waehlen!!"
    end
  end

  def admin_sign_in?
    if(user_signed_in?)
      current_user.admin?
    end
  end

  helper_method :admin_sign_in?
  helper_method :require_login!
  helper_method :require_artikel!
  helper_method :require_bestellung!
  helper_method :user_signed_in?
  helper_method :current_user
  helper_method :current_artikel
  helper_method :current_bestellung

end
