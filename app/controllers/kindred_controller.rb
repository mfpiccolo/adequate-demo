class KindredController < ApplicationController

  def scope
    model_instance = params[:class_name].constantize.find(params[:id])
    scope = model_instance.public_send(params[:relation]).to_json
    respond_to do |format|
      format.json { render json: scope }
    end
  end

end
