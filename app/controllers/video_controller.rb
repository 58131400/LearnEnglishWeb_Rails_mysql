class VideoController < ApplicationController
  def new
    @video = Video.new
  end

  def index
    if params[:id].nil?
      @videos = Video.all
    else
      key = params[:id]
      @videos = Video.where('name like ?', '%' + key + '%')

    end
  end
  
  def create
    @video = Video.new(video_params)
    @video.user_id = @current_user.UserID
    respond_to do |format|
      if @video.save
        format.html { redirect_to video_index_path, notice: 'Video was successfully created.' }
        format.json { render :show, status: :created, location: @video }
      else
        format.html { render :new }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end

  end

  def search
    redirect_to controller: 'video', action: 'index', id: params[:key] unless params[:key].nil?
  end
  
  def show
    
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_video
    @video = Video.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def video_params
    params.require(:video).permit(:content, :clip, :name, :thumbnail)
  end
end
