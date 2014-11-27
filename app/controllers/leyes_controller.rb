class LeyesController < ApplicationController
  # GET /leyes
  # GET /leyes.json
  def index
    @leyes = Leye.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @leyes }
    end
  end

  # GET /leyes/1
  # GET /leyes/1.json
  def show
    @leye = Leye.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @leye }
    end
  end

  # GET /leyes/new
  # GET /leyes/new.json
  def new
    @leye = Leye.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @leye }
    end
  end

  # GET /leyes/1/edit
  def edit
    @leye = Leye.find(params[:id])
  end

  # POST /leyes
  # POST /leyes.json
  def create
    @leye = Leye.new(params[:leye])

    respond_to do |format|
      if @leye.save
        format.html { redirect_to @leye, notice: 'Leye was successfully created.' }
        format.json { render json: @leye, status: :created, location: @leye }
      else
        format.html { render action: "new" }
        format.json { render json: @leye.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /leyes/1
  # PUT /leyes/1.json
  def update
    @leye = Leye.find(params[:id])

    respond_to do |format|
      if @leye.update_attributes(params[:leye])
        format.html { redirect_to @leye, notice: 'Leye was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @leye.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leyes/1
  # DELETE /leyes/1.json
  def destroy
    @leye = Leye.find(params[:id])
    @leye.destroy

    respond_to do |format|
      format.html { redirect_to leyes_url }
      format.json { head :no_content }
    end
  end
end
