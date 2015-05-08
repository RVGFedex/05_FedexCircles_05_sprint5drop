class PointsLogsController < ApplicationController
  before_action :set_points_log, only: [:show, :edit, :update, :destroy]

  # GET /points_logs
  # GET /points_logs.json
  def index
    @points_logs = PointsLog.all
  end

  # GET /points_logs/1
  # GET /points_logs/1.json
  def show
  end

  # GET /points_logs/new
  def new
    @points_log = PointsLog.new
  end

  # GET /points_logs/1/edit
  def edit
  end

  # POST /points_logs
  # POST /points_logs.json
  def create
    @points_log = PointsLog.new(points_log_params)

    respond_to do |format|
      if @points_log.save
        format.html { redirect_to @points_log, notice: 'Points log was successfully created.' }
        format.json { render :show, status: :created, location: @points_log }
      else
        format.html { render :new }
        format.json { render json: @points_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /points_logs/1
  # PATCH/PUT /points_logs/1.json
  def update
    respond_to do |format|
      if @points_log.update(points_log_params)
        format.html { redirect_to @points_log, notice: 'Points log was successfully updated.' }
        format.json { render :show, status: :ok, location: @points_log }
      else
        format.html { render :edit }
        format.json { render json: @points_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /points_logs/1
  # DELETE /points_logs/1.json
  def destroy
    @points_log.destroy
    respond_to do |format|
      format.html { redirect_to points_logs_url, notice: 'Points log was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_points_log
      @points_log = PointsLog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def points_log_params
      params.require(:points_log).permit(:circle_id, :policy_id, :reward_takeup_id, :event_type, :debit, :credit, :balance)
    end
end
