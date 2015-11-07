class SelectionsController < ApplicationController
    before_action :set_selection, only: [:show, :edit, :update, :destroy]
	before_action :set_album

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

        else
            redirect_to @album
        end
	end

    def destroy
        @selection.destroy
        redirect_to @album   
    end

    def export
      
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

end
