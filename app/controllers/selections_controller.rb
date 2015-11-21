    require 'rubygems'
    require 'zip'
    require 'open-uri'

class SelectionsController < ApplicationController
    before_action :set_selection, only: [:show, :edit, :update, :destroy, :download]
	before_action :set_album
    before_action :make_export, only: [:create]



    def show
        @selections = @album.selections
        @photos = @selection.photos.all
    end

	def new
		@selection=@album.selections.new
	end

	def create

		@selection = @album.selections.create(selection_params)
		@selection.owner_id = current_user.id
    	@selection.save

        if @selection.save

            #here I need to loop through photos and create shelvings
            (params[:photo_list]).each do |ph_id|
                ph = @album.photos.find(ph_id.to_i)
                @selection.shelvings.create(photo: ph)      
            end

            redirect_to [@album, @selection], notice: 'Selection was successfully created.'

            if @export == "yes"
                export_photos
            end

        else
            redirect_to @album
        end
	end

    def destroy
        @selection.destroy
        redirect_to @album   
    end

    def download
        export_photos
    end

    #def update_erase
    #  @belonging = @selection.belongings.find
    #    @selection.shelvings.delete()
    #end

	private

	def shelving_params

	end

    def set_selection
      @selection = Selection.find(params[:id])
    end

    def selection_params
      params.require(:selection).permit(:name)
    end

	def set_album
      @album = current_user.albums.find params[:album_id]
    end

    def make_export
        @export = params[:download]
    end

    def export_photos

        t = Tempfile.new("#{@selection.name}-#{Time.now}")
          Zip::OutputStream.open(t.path) do |z|
            @selection.photos.each do |item|
                z.put_next_entry(File.basename(item.picture.url))
                url1 =  item.picture.path if Rails.env.development? # Rails.root + path #Rails.root.to_s + Dir.pwd 'http://0.0.0.0:3000'
                url1 = item.picture.url if Rails.env.production?
                url1_data = open(url1)
                z.print IO.read(url1_data)
          end
        end

        send_file t.path, :type => 'application/zip',
                                 :disposition => 'attachment',
                                 :filename => "#{@selection.name}.zip"
                                 
        t.close 
 
    end

end
