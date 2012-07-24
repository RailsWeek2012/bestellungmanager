class UsersController < ApplicationController
     # before_filter :admin_required!, :except => [:new, :create, :show, :destroy, :edit, :update]
     #before_filter :require_login!, :except => [:new , :create]
     load_and_authorize_resource
  def index
    @users = User.all

  end


  def show
    @user = User.find(params[:id])

  end


  def new
    @user = User.new

  end


  def edit
    @user = current_user
  end


  def create
    @user = User.new(params[:user])

      if @user.save
        redirect_to login_path,
        notice: "Ihr Benutzerkonto wurde angelegt!"
      else
        render action: "new"

      end
    end



  def update
    @user = current_user

      if @user.update_attributes(params[:user])
         redirect_to artikel_path, notice: 'Update durchgefuehrt!!'
    else
         render action: "edit"
      end

  end

  def destroy
    @user = User.find(params[:id])
    @user.auftrags.destroy_all
    @user.bestellungs.destroy_all
    @user .update_attribute(:name, nil)
    @user. update_attribute(:email , nil )
    @user.update_attribute(:password_digest,nil)
    @user.save
    unless admin_sign_in?
    session[:user_id] = nil
    end
    redirect_to artikels_path

  end
end
