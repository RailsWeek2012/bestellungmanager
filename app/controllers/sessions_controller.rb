class SessionsController < ApplicationController
  def new

  end
  def create
     auth_hash = request.env['omniauth.auth']
    @authorization = Authorization.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])

    if(@authorization.present?)
      session[:user_id]   = User.find(@authorization.user_id)
      redirect_to root_path   :notice => "Sie sind eingelogt"
    else
      session[:auth]= auth_hash
     redirect_to new_user_path,  :notice => "Bitte Formular ausfuellen"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Signed out!"
  end

end
