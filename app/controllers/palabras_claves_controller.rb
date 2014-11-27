class PalabrasClavesController < ApplicationController
  # GET /palabras_claves
  # GET /palabras_claves.json
  def index
    @palabras_claves = PalabrasClave.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @palabras_claves }
    end
  end

  # GET /palabras_claves/1
  # GET /palabras_claves/1.json
  def show
    @palabras_clafe = PalabrasClave.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @palabras_clafe }
    end
  end

  # GET /palabras_claves/new
  # GET /palabras_claves/new.json
  def new
    @palabras_clafe = PalabrasClave.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @palabras_clafe }
    end
  end

  # GET /palabras_claves/1/edit
  def edit
    @palabras_clafe = PalabrasClave.find(params[:id])
  end

  # POST /palabras_claves
  # POST /palabras_claves.json
  def create
    @palabras_clafe = PalabrasClave.new(params[:palabras_clafe])

    respond_to do |format|
      if @palabras_clafe.save
        format.html { redirect_to @palabras_clafe, notice: 'Palabras clave was successfully created.' }
        format.json { render json: @palabras_clafe, status: :created, location: @palabras_clafe }
      else
        format.html { render action: "new" }
        format.json { render json: @palabras_clafe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /palabras_claves/1
  # PUT /palabras_claves/1.json
  def update
    @palabras_clafe = PalabrasClave.find(params[:id])

    respond_to do |format|
      if @palabras_clafe.update_attributes(params[:palabras_clafe])
        format.html { redirect_to @palabras_clafe, notice: 'Palabras clave was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @palabras_clafe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /palabras_claves/1
  # DELETE /palabras_claves/1.json
  def destroy
    @palabras_clafe = PalabrasClave.find(params[:id])
    @palabras_clafe.destroy

    respond_to do |format|
      format.html { redirect_to palabras_claves_url }
      format.json { head :no_content }
    end
  end
end
