class PalabraClavesController < ApplicationController
  # GET /palabra_claves
  # GET /palabra_claves.json
  def index
    @palabra_claves = PalabraClave.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @palabra_claves }
    end
  end

  # GET /palabra_claves/1
  # GET /palabra_claves/1.json
  def show
    @palabra_clafe = PalabraClave.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @palabra_clafe }
    end
  end

  # GET /palabra_claves/new
  # GET /palabra_claves/new.json
  def new
    @palabra_clafe = PalabraClave.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @palabra_clafe }
    end
  end

  # GET /palabra_claves/1/edit
  def edit
    @palabra_clafe = PalabraClave.find(params[:id])
  end

  # POST /palabra_claves
  # POST /palabra_claves.json
  def create
    @palabra_clafe = PalabraClave.new(params[:palabra_clafe])

    respond_to do |format|
      if @palabra_clafe.save
        format.html { redirect_to @palabra_clafe, notice: 'Palabra clave was successfully created.' }
        format.json { render json: @palabra_clafe, status: :created, location: @palabra_clafe }
      else
        format.html { render action: "new" }
        format.json { render json: @palabra_clafe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /palabra_claves/1
  # PUT /palabra_claves/1.json
  def update
    @palabra_clafe = PalabraClave.find(params[:id])

    respond_to do |format|
      if @palabra_clafe.update_attributes(params[:palabra_clafe])
        format.html { redirect_to @palabra_clafe, notice: 'Palabra clave was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @palabra_clafe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /palabra_claves/1
  # DELETE /palabra_claves/1.json
  def destroy
    @palabra_clafe = PalabraClave.find(params[:id])
    @palabra_clafe.destroy

    respond_to do |format|
      format.html { redirect_to palabra_claves_url }
      format.json { head :no_content }
    end
  end
end
