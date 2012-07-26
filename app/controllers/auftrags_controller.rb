class AuftragsController < ApplicationController
  load_and_authorize_resource
  before_filter :require_login!
  before_filter :require_bestellung! ,:except => [:show, :destroy, :edit, :update]
  def index
    @auftrags = current_bestellung.auftrags.all



  end

  def show
    if(sign_bestellung_in?)
    @auftrag = current_bestellung.auftrags.find(params[:id])
    else
    @auftrag= current_user.auftrags.find(params[:id])
     end

  end

  def new
    @auftrag = current_user.auftrags.new

  end

  def edit
    @auftrag = current_user.auftrags.find(params[:id])

  end

  def create
    @auftrag = current_user.auftrags.new(params[:auftrag])
    @auftrag.bestellung_id = current_bestellung.id

    if @auftrag.save
      redirect_to @auftrag, notice: 'Auftrag wurde erfolgreich erstellt'

    else
      render action: "new"
    end

  end

  def update
    @auftrag = current_user.auftrags.find(params[:id])


    if @auftrag.update_attributes(params[:auftrag])
      if(sign_bestellung_in?)
      redirect_to @auftrag,
                     notice: 'Auftrag wurde erfolgreich geaendert.'
      else
        redirect_to current_user,
                    notice: 'Auftrag wurde erfolgreich geaendert.'
      end

    else
      render action: "edit"

    end

  end

  def destroy
    @auftrag = current_user.auftrags.find(params[:id])
    @auftrag.destroy
    if(sign_bestellung_in?)
      redirect_to current_bestellung,
                  notice: 'Bestellung wurde erfolgreich geloescht.'
    else
      redirect_to current_user,
                  notice: 'Bestellung wurde erfolgreich geloescht.'
    end

  end

end
