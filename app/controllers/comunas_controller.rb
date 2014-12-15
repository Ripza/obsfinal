class ComunasController < ApplicationController
  # GET /comunas
  # GET /comunas.json
  def index
    @comunas = Comuna.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comunas }
    end
  end

  # GET /comunas/1
  # GET /comunas/1.json
  def show
    @comuna = Comuna.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comuna }
    end
  end

  # GET /comunas/new
  # GET /comunas/new.json
  def new
    @comuna = Comuna.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comuna }
    end
  end

  # GET /comunas/1/edit
  def edit
    @comuna = Comuna.find(params[:id])
  end

  # POST /comunas
  # POST /comunas.json
  def create
    @comuna = Comuna.new(params[:comuna])

    respond_to do |format|
      if @comuna.save
        format.html { redirect_to @comuna, notice: 'Comuna was successfully created.' }
        format.json { render json: @comuna, status: :created, location: @comuna }
      else
        format.html { render action: "new" }
        format.json { render json: @comuna.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /comunas/1
  # PUT /comunas/1.json
  def update
    @comuna = Comuna.find(params[:id])

    respond_to do |format|
      if @comuna.update_attributes(params[:comuna])
        format.html { redirect_to @comuna, notice: 'Comuna was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @comuna.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comunas/1
  # DELETE /comunas/1.json
  def destroy
    @comuna = Comuna.find(params[:id])
    @comuna.destroy

    respond_to do |format|
      format.html { redirect_to comunas_url }
      format.json { head :no_content }
    end
  end
end
