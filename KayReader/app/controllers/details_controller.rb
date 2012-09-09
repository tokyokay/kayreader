class DetailsController < ApplicationController
  # GET /details
  # GET /details.json
  def index
    @details = Detail.find_all_by_site_id(params[:site_id])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @details }
    end
  end

  # GET /details/1
  # GET /details/1.json
  def show
    @detail = Detail.find(params[:id])
    #site_idとidで検索

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @detail }
    end
  end
end
