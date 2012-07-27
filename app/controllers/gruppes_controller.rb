class GruppesController < ApplicationController
  load_and_authorize_resource
  before_filter :require_login!
  before_filter :require_artikel!  ,:except => [:show, :destroy, :edit, :update]

  def index
    @gruppes = current_artikel.gruppes.all

    session[:gruppe_id] = nil
  end


  def show
    if(artikel_signed_in?)
    @gruppe = current_artikel.gruppes.find(params[:id])
    else
      @gruppe = current_user.gruppes.find(params[:id])
    end

    session[:gruppe_id] = @gruppe.id

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @gruppe}
      format.pdf { render :layout => false }
    end


  end


  def new
    @gruppe = current_user.gruppes.new


  end


  def edit
    if(artikel_signed_in?)
      @gruppe = current_artikel.gruppes.find(params[:id])
    else
      @gruppe = current_user.gruppes.find(params[:id])
    end
  end


  def create
    @gruppe = current_user.gruppes.new(params[:gruppe])
    @gruppe.artikel_id= current_artikel.id

      if @gruppe.save
         redirect_to @gruppe,
                     notice: 'Gruppe wurde erfolgreich erstellt.'
      else
         render action: "new"

      end

  end


  def update
      @gruppe = current_user.gruppes.find(params[:id])

      if @gruppe.update_attributes(params[:gruppe])
        if artikel_signed_in?
          redirect_to @gruppe,
                      notice: 'Gruppe wurde erfolgreich geaendert.'
        else
          redirect_to current_user
        end
      else
         render action: "edit"
      end


  end


  def destroy
    @gruppe = current_user.gruppes.find(params[:id])
    @gruppe.bestellungs.destroy_all
    @gruppe.destroy

    if(artikel_signed_in?)
      redirect_to gruppes_path,
                  notice: 'Gruppe wurde erfolgreich geloescht.'
    else
      redirect_to current_user,
                  notice: 'Gruppe wurde erfolgreich geloescht.'
    end
    end

end
