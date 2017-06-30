class SongsController < ApplicationController

    def index
    @artist = Artist.find(params["artist_id"])
    @songs = @artist.songs
    render json: @songs  
    #Overwrites the assumption to render an index.html.erb
    end

    def show
       @artist = Artist.find(params[:artist_id])  
       @song = @artist.songs.find(params[:id])
            render json: {
                artist: @artist,
                songs: @song
            }
    end

    def create
      @artist = Artist.find(params[:artist_id])
      @song = @artist.songs.create(params[:id])
        if @song.save
            redirect_to artist_path(@artist)
        else
            render status: 500,
                json: {
                error: @song.errors
            }
        end      
  end

  def update
      @artist = Artist.find(params[:id])
      @artist.song.update(params[:id])
    if @song.update(params[:id])
        redirect_to artist_path(@artist)
    else
        render status: 500,
            json: {
            error: @song.errors
        }
    end      

  end 

#   def destroy
#       @artist =Artist.find(params[:id])

#       if @artist.destroy
#       redirect_to artists_path
#     else
#         render status: 500,
#         json: {
#             error:'Could not delete'
#         }

#     end        
#   end       

#   private
#   def artist_params
#     params.require(:artist).permit(:name, :photo_url, :nationality)
#   end
end
