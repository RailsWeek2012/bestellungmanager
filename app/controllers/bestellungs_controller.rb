class BestellungsController < ApplicationController
  load_and_authorize_resource
  before_filter :require_login!
  before_filter :require_gruppe! ,:except => [:show, :destroy, :edit, :update]
  def index
    @bestellungs = current_gruppe.bestellungs.all



  end

  def show
    if(sign_gruppe_in?)
    @bestellung = current_gruppe.bestellungs.find(params[:id])
    else
    @bestellung= current_user.bestellungs.find(params[:id])
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
    @bestellung.name = current_user.name
    @bestellung.gruppe_id = current_gruppe.id

    if @bestellung.save
      redirect_to @bestellung, notice: 'Bestellung wurde erfolgreich erstellt'

    else
      render action: "new"
    end

  end

  def update
    @bestellung = current_user.bestellungs.find(params[:id])


    if @bestellung.update_attributes(params[:bestellung])
      if(sign_gruppe_in?)
      redirect_to @bestellung,
                     notice: 'Bestellung wurde erfolgreich geaendert.'
      else
        redirect_to current_user,
                    notice: 'Bestellung wurde erfolgreich geaendert.'
      end

    else
      render action: "edit"

    end

  end

  def destroy
    @bestellung = current_user.bestellungs.find(params[:id])
    @bestellung.destroy
    if(sign_gruppe_in?)
      redirect_to auftrags_path,
                  notice: 'Bestellung wurde erfolgreich geloescht.'
    else
      redirect_to current_user,
                  notice: 'Bestellung wurde erfolgreich geloescht.'
    end

  end

end
