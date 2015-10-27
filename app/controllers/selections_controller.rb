class SelectionsController < ApplicationController
    before_action :set_selection, only: [:show, :edit, :update, :destroy]
	before_action :set_album

	def new
		@selection=@album.selections.new
	end

	def create

		@selection = @album.selections.create(selection_params)
		redirect_to @album
	end

	def parse_paramase 

	end

	private

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
