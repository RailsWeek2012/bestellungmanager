class BestellungsController < ApplicationController
  load_and_authorize_resource
  before_filter :require_login!
  before_filter :require_artikel!
  def index
    @bestellungs = current_artikel.bestellungs.all


  end


  def show
    @bestellung = current_artikel.bestellungs.find(params[:id])
    session[:bestellung_id] = @bestellung.id
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @bestellung}
      format.pdf { render :layout => false } # Add this line
    end


  end


  def new
    @bestellung = current_user.bestellungs.new


  end


  def edit
    @bestellung = current_user.bestellungs.find(params[:id])
  end


  def create
    @bestellung = current_user.bestellungs.new(params[:bestellung])
    @bestellung.artikel_id= current_artikel.id

      if @bestellung.save
         redirect_to @bestellung,
                     notice: 'Bestellung was successfully created.'

      else
         render action: "new"

      end

  end


  def update
    @bestellung = current_user.bestellungs.find(params[:id])


      if @bestellung.update_attributes(params[:bestellung])
         redirect_to @bestellung, notice: 'Bestellung was successfully updated.'

      else
         render action: "edit"
      end


  end


  def destroy
    @bestellung = current_user.bestellungs.find(params[:id])
    @bestellung.auftrags.destroy_all
    @bestellung.destroy


       redirect_to bestellungs_url

    end

end
