class ShelvingsController < ApplicationController
	before_action :set_shelving, only: [:destroy]
	before_action :set_selection

	def destroy
		@shelving.destroy
		if @selection.photos.count == 0 then
			@selection.destroy
			redirect_to @album
		else
			redirect_to [@album, @selection]
		end
	end

	private

	def set_shelving
		@shelving = Shelving.find(params[:id])
	end

	def set_selection
		sel_id = @shelving.selection_id
		@selection = Selection.find_by(id: sel_id)
		al_id = @selection.album_id
		@album = Album.find_by(id: al_id)
	end
	
end
