class TransaccionFlotantesController < ApplicationController
  before_action :set_transaccion_flotante, only: %i[ show edit update destroy ]

  # GET /transaccion_flotantes or /transaccion_flotantes.json
  def index
    @transaccion_flotantes = TransaccionFlotante.all
  end

  # GET /transaccion_flotantes/1 or /transaccion_flotantes/1.json
  def show
  end

  # GET /transaccion_flotantes/new
  def new
    @transaccion_flotante = TransaccionFlotante.new
  end

  # GET /transaccion_flotantes/1/edit
  def edit
  end

  # POST /transaccion_flotantes or /transaccion_flotantes.json
  def create
    @transaccion_flotante = TransaccionFlotante.new(transaccion_flotante_params)

    respond_to do |format|
      if @transaccion_flotante.save
        format.html { redirect_to @transaccion_flotante, notice: "Transaccion flotante was successfully created." }
        format.json { render :show, status: :created, location: @transaccion_flotante }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @transaccion_flotante.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transaccion_flotantes/1 or /transaccion_flotantes/1.json
  def update
    respond_to do |format|
      if @transaccion_flotante.update(transaccion_flotante_params)
        format.html { redirect_to @transaccion_flotante, notice: "Transaccion flotante was successfully updated." }
        format.json { render :show, status: :ok, location: @transaccion_flotante }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @transaccion_flotante.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transaccion_flotantes/1 or /transaccion_flotantes/1.json
  def destroy
    @transaccion_flotante.destroy!

    respond_to do |format|
      format.html { redirect_to transaccion_flotantes_path, status: :see_other, notice: "Transaccion flotante was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaccion_flotante
      @transaccion_flotante = TransaccionFlotante.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def transaccion_flotante_params
      params.require(:transaccion_flotante).permit(:cuenta_id, :descipcion, :estado, :fecha, :saldo_anterior, :monto, :saldo_actual, :tipo)
    end
end
