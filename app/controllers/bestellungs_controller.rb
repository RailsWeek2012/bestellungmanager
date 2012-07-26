class BestellungsController < ApplicationController
  load_and_authorize_resource
  before_filter :require_login!
  before_filter :require_artikel!  ,:except => [:show, :destroy, :edit, :update]

  def index
    @bestellungs = current_artikel.bestellungs.all

    session[:bestellung_id] = nil
  end


  def show
    if(artikel_signed_in?)
    @bestellung = current_artikel.bestellungs.find(params[:id])
    else
      @bestellung = current_user.bestellungs.find(params[:id])
    end

    session[:bestellung_id] = @bestellung.id

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @bestellung}
      format.pdf { render :layout => false }
    end


  end


  def new
    @bestellung = current_user.bestellungs.new


  end


  def edit
    if(artikel_signed_in?)
      @bestellung = current_artikel.bestellungs.find(params[:id])
    else
      @bestellung = current_user.bestellungs.find(params[:id])
    end
  end


  def create
    @bestellung = current_user.bestellungs.new(params[:bestellung])
    @bestellung.artikel_id= current_artikel.id

      if @bestellung.save
         redirect_to @bestellung,
                     notice: 'Bestellung wurde erfolgreich erstellt.'
      else
         render action: "new"

      end

  end


  def update
      @bestellung = current_user.bestellungs.find(params[:id])

      if @bestellung.update_attributes(params[:bestellung])
        if artikel_signed_in?
          redirect_to @bestellung,
                      notice: 'Bestellung wurde erfolgreich geaendert.'
        else
          redirect_to current_user
        end
      else
         render action: "edit"
      end


  end


  def destroy
    @bestellung = current_user.bestellungs.find(params[:id])
    @bestellung.auftrags.destroy_all
    @bestellung.destroy

    if(artikel_signed_in?)
      redirect_to bestellungs_path,
                  notice: 'Bestellung wurde erfolgreich geloescht.'
    else
      redirect_to current_user,
                  notice: 'Bestellung wurde erfolgreich geloescht.'
    end
    end

end
