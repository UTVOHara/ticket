class TicksController < ApplicationController
  before_action :set_tick, only: %i[ show edit update destroy ]

  # GET /ticks or /ticks.json
  def index
    @ticks = Tick.all
  end

  # GET /ticks/1 or /ticks/1.json
  def show
  end

  # GET /ticks/new
  def new
    @tick = Tick.new
  end

  # GET /ticks/1/edit
  def edit
  end

  # POST /ticks or /ticks.json
  def create
    @tick = Tick.new(tick_params)

    respond_to do |format|
      if @tick.save
        format.html { redirect_to tick_url(@tick), notice: "Tick was successfully created." }
        format.json { render :show, status: :created, location: @tick }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tick.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ticks/1 or /ticks/1.json
  def update
    respond_to do |format|
      if @tick.update(tick_params)
        format.html { redirect_to tick_url(@tick), notice: "Tick was successfully updated." }
        format.json { render :show, status: :ok, location: @tick }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tick.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ticks/1 or /ticks/1.json
  def destroy
    @tick.destroy

    respond_to do |format|
      format.html { redirect_to ticks_url, notice: "Tick was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tick
      @tick = Tick.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tick_params
      params.require(:tick).permit(:name, :price, :description, :time)
    end
end
