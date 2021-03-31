class PhotosController < ApplicationController
  def index
    @photos = Photo.all
  end

  def show
    @photo = Photo.find(params[:id])

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
    photo = Photo.find(params[:id])

    photo.update(photo_params)

    redirect_to photo
  end

  # DELETE /photos/:id
  def destroy
    photo = Photo.find(params[:id])
    photo.destroy

    respond_to do |format|
      format.html { redirect_to '/photos' }
      format.json { head :ok }
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:title, :image_url)
  end
end
