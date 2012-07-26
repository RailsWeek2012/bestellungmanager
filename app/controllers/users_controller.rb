class UsersController < ApplicationController

     before_filter :require_login!, :except => [:new , :create]
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
    @user = User.find(params[:id])
  end


  def create
    
    @user = User.new(params[:user])
    auth_hash = session[:auth]
    @user.authorization = Authorization.new :provider=> auth_hash["provider"],:uid => auth_hash["uid"]
    att = auth_hash[:extra][:attributes]
    @user.email= att[0].mail

    if @user.save
         session[:auth]= nil
        session[:user_id]= @user.id
        redirect_to root_path,
        notice: "Ihr Benutzerkonto wurde angelegt!"
      else
        render action: "new"

      end

    end



  def update
    @user = current_user

      if @user.update_attributes(params[:user])
         redirect_to user_path, notice: 'Update durchgefuehrt!!'
    else
         render action: "edit"
      end

  end

  def destroy
    @user = User.find(params[:id])
    @user.auftrags.destroy_all
    @user.bestellungs.destroy_all
    @user.authorization.destroy
    @user.update_attribute(:email,nil)
    @user .update_attribute(:name, nil)

    @user.save
    unless admin_sign_in?
    session[:user_id] = nil
    end
    redirect_to artikels_path

  end
end
