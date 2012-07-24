class AuftragsController < ApplicationController
  before_filter :require_login!
  before_filter :require_bestellung!
  def index
    @auftrags = current_bestellung.auftrags.all
    respond_to do |format|
      format.html # show.html.erb
      format.pdf { render :layout => false } # Add this line
    end

  end

  def show
    @auftrag = current_bestellung.auftrags.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.pdf { render :layout => false } # Add this line
    end
  end


  def new
    @auftrag = current_user.auftrags.new

  end

  def edit
    @auftrag = current_bestellung.auftrags.find(params[:id])
  end


  def create
    @auftrag = current_user.auftrags.new(params[:auftrag])
     @auftrag.bestellung_id = current_bestellung.id

      if @auftrag.save
        redirect_to @auftrag, notice: 'Auftrag was successfully created.'

      else
         render action: "new"
      end

  end


  def update
    @auftrag = current_user.auftrags.find(params[:id])
    @auftrag.bestellung_id = current_bestellung.id

      if @auftrag.update_attributes(params[:auftrag])
         redirect_to @auftrag,
                     notice: 'Auftrag was successfully updated.'

      else
         render action: "edit"

      end

  end


  def destroy
    @auftrag = current_user.auftrags.find(params[:id])
    @auftrag.destroy

      redirect_to auftrags_url
    end

end
