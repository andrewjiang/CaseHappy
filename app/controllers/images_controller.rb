class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :destroy]

  # GET /images
  def index
    @images = Image.all
  end

  # GET /images/1
  def show
  end

  # POST /images
  def create
    @image = Image.new(image_params)

    if @image.save
      render :json => { :url => @image.payload.url(:original), :thumbnail_url => @image.payload.url(:thumb) }
    else
      render :json => { :error => 'Image failed to upload!' }
    end
  end

  # DELETE /images/1
  def destroy
    @image.destroy
    redirect_to images_url, notice: 'Image was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def image_params
      params.require(:image).permit(:payload)
    end
end
