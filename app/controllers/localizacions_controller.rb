class LocalizacionsController < ApplicationController
  # GET /localizacions
  # GET /localizacions.json
  def index
    @localizacions = Localizacion.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @localizacions }
    end
  end

  # GET /localizacions/1
  # GET /localizacions/1.json
  def show
    @localizacion = Localizacion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @localizacion }
    end
  end

  # GET /localizacions/new
  # GET /localizacions/new.json
  def new
    @localizacion = Localizacion.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @localizacion }
    end
  end

  # GET /localizacions/1/edit
  def edit
    @localizacion = Localizacion.find(params[:id])
  end

  # POST /localizacions
  # POST /localizacions.json
  def create
    @localizacion = Localizacion.new(params[:localizacion])

    respond_to do |format|
      if @localizacion.save
        format.html { redirect_to @localizacion, notice: 'Localizacion was successfully created.' }
        format.json { render json: @localizacion, status: :created, location: @localizacion }
      else
        format.html { render action: "new" }
        format.json { render json: @localizacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /localizacions/1
  # PUT /localizacions/1.json
  def update
    @localizacion = Localizacion.find(params[:id])

    respond_to do |format|
      if @localizacion.update_attributes(params[:localizacion])
        format.html { redirect_to @localizacion, notice: 'Localizacion was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @localizacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /localizacions/1
  # DELETE /localizacions/1.json
  def destroy
    @localizacion = Localizacion.find(params[:id])
    @localizacion.destroy

    respond_to do |format|
      format.html { redirect_to localizacions_url }
      format.json { head :no_content }
    end
  end
end
