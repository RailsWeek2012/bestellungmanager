
class ArtikelsController < ApplicationController
  before_filter :require_login!
  load_and_authorize_resource
  def index
    @artikels = Artikel.all
   end


  def show
    @artikel = Artikel.find(params[:id])
    session[:artikel_id] = @artikel.id
  end

  def new
    @artikel = current_user.artikels.new
  end


  def edit
    @artikel = current_user.artikels.find(params[:id])
  end


  def create
    @artikel = current_user.artikels.new(params[:artikel])

      if @artikel.save
        redirect_to @artikel,
                     notice: 'Artikel was successfully created.'
         else
         render action: "new"
      end
  end


  def update

    @artikel = current_user.artikels.find(params[:id])

      if @artikel.update_attributes(params[:artikel])
        redirect_to @artikel,
                    notice: 'Artikel was successfully updated.'

      else
        render action: "edit"
      end

  end


  def destroy
    @artikel = Artikel.find(params[:id])


    FileUtils.rm_rf "public/uploads/artikel/image/#{@artikel.id}"

    @artikel.destroy

    redirect_to artikels_url
  end

  def laden
    send_file "public/#{Artikel.find(params[:id]).image}"

  end





end
