# frozen_string_literal: true

class TimelogsController < ApplicationController
  before_action :set_timelog, only: %i[show edit update destroy]
  before_action :authenticate_user!, only: %i[index show new edit create update destroy]

  # GET /timelogs
  # GET /timelogs.json
  def index
    @current_user = current_user
    @timelogs = @current_user.timelogs
  end

  # GET /timelogs/1
  # GET /timelogs/1.json
  def show
    @current_user = current_user
    not_found and return unless @timelog.user == @current_user
  end

  # GET /timelogs/new
  def new
    @timelog = Timelog.new
  end

  # GET /timelogs/1/edit
  def edit; end

  # POST /timelogs
  # POST /timelogs.json
  def create
    @timelog = Timelog.new(timelog_params)
    @timelog.user_id = current_user.id unless @timelog.user_id

    respond_to do |format|
      if @timelog.save
        format.html { redirect_to timelogs_url, notice: 'Timelog was successfully created.' }
        format.json { render :show, status: :created, location: @timelog }
      else
        format.html { render :new }
        format.json { render json: @timelog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /timelogs/1
  # PATCH/PUT /timelogs/1.json
  def update
    @current_user = current_user
    not_found and return unless @timelog.user == @current_user

    respond_to do |format|
      if @timelog.update(timelog_params)
        format.html { redirect_to @timelog, notice: 'Timelog was successfully updated.' }
        format.json { render :show, status: :ok, location: @timelog }
      else
        format.html { render :edit }
        format.json { render json: @timelog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /timelogs/1
  # DELETE /timelogs/1.json
  def destroy
    @current_user = current_user
    not_found and return unless @timelog.user == @current_user

    @timelog.destroy
    respond_to do |format|
      format.html { redirect_to timelogs_url, notice: 'Timelog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_timelog
    @timelog = Timelog.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def timelog_params
    params.require(:timelog).permit(:project_id, :user_id, :amount, :billable)
  end
end
