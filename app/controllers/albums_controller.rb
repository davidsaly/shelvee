class AlbumsController < ApplicationController
  before_action :set_album, only: [:show, :edit, :update, :destroy]
  before_action :correct_user

  # GET /albums
  # GET /albums.json
  def index
    @albums = current_user.albums.all
    @album = Album.new

    @my_albums = current_user.albums.where(owner: current_user)
    @shared_albums = current_user.albums.where.not(owner: current_user)

    #@cooperations = 
  end

  # GET /albums/1
  # GET /albums/1.json
  def show
    @photo = Photo.new
    @photos= @album.photos.all
    @selection=@album.selections.new
    @selections = @album.selections
    @invitation = @album.invitations.new

    gon.photos = @photos
    #@@album = Album.find(params[:id])
  end

  # GET /albums/new
  def new
    @album = Album.new
  end

  # GET /albums/1/edit
  def edit
  end

  # POST /albums
  # POST /albums.json
  def create
    #@album = Album.new(album_params)
    @album = current_user.albums.build(album_params)
    @album.owner_id = current_user.id
    @album.save
    @album.cooperations.create!(user: current_user)

    respond_to do |format|
      if @album.save
        format.html { redirect_to @album, notice: 'Album was successfully created.' }
        format.json { render :show, status: :created, location: @album }
      else
        format.html { render :new }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /albums/1
  # PATCH/PUT /albums/1.json
  def update
    respond_to do |format|
      if @album.update(album_params)
        format.html { redirect_to @album, notice: 'Album was successfully updated.' }
        format.json { render :show, status: :ok, location: @album }
      else
        format.html { render :edit }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /albums/1
  # DELETE /albums/1.json
  def destroy
    @album.destroy
    respond_to do |format|
      format.html { redirect_to albums_url, notice: 'Album was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_album
      @album = Album.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def album_params
      params.require(:album).permit(:title, :description)
    end

    def correct_user
      @album = current_user.albums.find_by(id: params[:id])
      #redirect_to root_url if @album.nil?
    end
end
