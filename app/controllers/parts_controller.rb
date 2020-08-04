class PartsController < ApplicationController
  def index
    @part = Part.find(params[:id])
    @id = @part.PartId
    @unitId = @part.unit_id
    @content = @part.Content
    @words = @part.words

  end


end
