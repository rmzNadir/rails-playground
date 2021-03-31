class PhotosController < ApplicationController
  before_action :set_photo, only: %i[show update destroy]

  def index
    @photos = Photo.all
  end

  def show
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @photo }
    end
  end

  def new; end

  def create
    photo = Photo.new(photo_params)

    photo.save

    respond_to do |format|
      format.html { redirect_to photo }
      format.json { render json: photo, status: :created }
    end
  end

  # GET /photos/:id/edit
  def edit
    @id = params[:id]
  end

  # PUT/PATCH /photos/:id
  def update
    @photo.update(photo_params)

    redirect_to photo
  end

  # DELETE /photos/:id
  def destroy
    @photo.destroy

    respond_to do |format|
      format.html { redirect_to '/photos' }
      format.json { head :ok }
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:title, :image_url)
  end

  def set_photo
    @photo = Photo.find(params[:id])
  end
end
