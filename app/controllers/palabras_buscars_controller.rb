class PalabrasBuscarsController < ApplicationController
  # GET /palabras_buscars
  # GET /palabras_buscars.json
  def index
    @palabras_buscars = PalabrasBuscar.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @palabras_buscars }
    end
  end

  # GET /palabras_buscars/1
  # GET /palabras_buscars/1.json
  def show
    @palabras_buscar = PalabrasBuscar.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @palabras_buscar }
    end
  end

  # GET /palabras_buscars/new
  # GET /palabras_buscars/new.json
  def new
    @palabras_buscar = PalabrasBuscar.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @palabras_buscar }
    end
  end

  # GET /palabras_buscars/1/edit
  def edit
    @palabras_buscar = PalabrasBuscar.find(params[:id])
  end

  # POST /palabras_buscars
  # POST /palabras_buscars.json
  def create
    @palabras_buscar = PalabrasBuscar.new(params[:palabras_buscar])

    respond_to do |format|
      if @palabras_buscar.save
        format.html { redirect_to @palabras_buscar, notice: 'Palabras buscar was successfully created.' }
        format.json { render json: @palabras_buscar, status: :created, location: @palabras_buscar }
      else
        format.html { render action: "new" }
        format.json { render json: @palabras_buscar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /palabras_buscars/1
  # PUT /palabras_buscars/1.json
  def update
    @palabras_buscar = PalabrasBuscar.find(params[:id])

    respond_to do |format|
      if @palabras_buscar.update_attributes(params[:palabras_buscar])
        format.html { redirect_to @palabras_buscar, notice: 'Palabras buscar was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @palabras_buscar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /palabras_buscars/1
  # DELETE /palabras_buscars/1.json
  def destroy
    @palabras_buscar = PalabrasBuscar.find(params[:id])
    @palabras_buscar.destroy

    respond_to do |format|
      format.html { redirect_to palabras_buscars_url }
      format.json { head :no_content }
    end
  end
end
