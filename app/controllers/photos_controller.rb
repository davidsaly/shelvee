class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]
  before_action :set_album

  # GET /photos
  # GET /photos.json
  def index
    @photos = Photo.all
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
  end

  # GET /photos/new
  def new
    @photo = @album.photos.new
  end

  # GET /photos/1/edit
  def edit
  end

  # POST /photos
  # POST /photos.json
  def create
    #@photo = @album.photos.new(photo_params)
    
    @photo = @album.photos.create(photo_params) #params[:painting]
    @photo.belongings.create!(album: @album)

    #respond_to do |format|
      #if @photo.save
        #@photo.belongings.create!(album: @album)
        #format.html { redirect_to @photo, notice: 'Photo was successfully created.' }
       # format.html { redirect_to @album, notice: 'Photo was successfully created.' }
       # format.json { render :show, status: :created, location: @album }
      #else
        #format.html { render :new }
        #format.json { render json: @photo.errors, status: :unprocessable_entity }
      #end
    #end
  end

  # PATCH/PUT /photos/1
  # PATCH/PUT /photos/1.json
  def update
    respond_to do |format|
      if @photo.update(photo_params)
        format.html { redirect_to @photo, notice: 'Photo was successfully updated.' }
        format.json { render :show, status: :ok, location: @photo }
      else
        format.html { render :edit }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @photo.destroy
    respond_to do |format|
      format.html { redirect_to photos_url, notice: 'Photo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find(params[:id])
    end

    def set_album
      @album = Album.find params[:album_id]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_params
      params.require(:photo).permit(:description, :picture)
    end
end
