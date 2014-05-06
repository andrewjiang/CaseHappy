class DesignsController < ApplicationController
  # POST /designs
  def create
    @design = Design.new(image_params)

    if @design.save
      render :json => {:url => @design.renders.url(:original), :medium_url => @design.renders.url(:medium)}
    else
      render :json => {:error => 'Design failed to upload!'}
    end
  end

  # Only allow a trusted parameter "white list" through.
  def image_params
    params.require(:design).permit(:renders)
  end
end
