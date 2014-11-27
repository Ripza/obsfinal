class TweetsPalClavesController < ApplicationController
  # GET /tweets_pal_claves
  # GET /tweets_pal_claves.json
  def index
    @tweets_pal_claves = TweetsPalClafe.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tweets_pal_claves }
    end
  end

  # GET /tweets_pal_claves/1
  # GET /tweets_pal_claves/1.json
  def show
    @tweets_pal_clafe = TweetsPalClafe.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tweets_pal_clafe }
    end
  end

  # GET /tweets_pal_claves/new
  # GET /tweets_pal_claves/new.json
  def new
    @tweets_pal_clafe = TweetsPalClafe.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tweets_pal_clafe }
    end
  end

  # GET /tweets_pal_claves/1/edit
  def edit
    @tweets_pal_clafe = TweetsPalClafe.find(params[:id])
  end

  # POST /tweets_pal_claves
  # POST /tweets_pal_claves.json
  def create
    @tweets_pal_clafe = TweetsPalClafe.new(params[:tweets_pal_clafe])

    respond_to do |format|
      if @tweets_pal_clafe.save
        format.html { redirect_to @tweets_pal_clafe, notice: 'Tweets pal clafe was successfully created.' }
        format.json { render json: @tweets_pal_clafe, status: :created, location: @tweets_pal_clafe }
      else
        format.html { render action: "new" }
        format.json { render json: @tweets_pal_clafe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tweets_pal_claves/1
  # PUT /tweets_pal_claves/1.json
  def update
    @tweets_pal_clafe = TweetsPalClafe.find(params[:id])

    respond_to do |format|
      if @tweets_pal_clafe.update_attributes(params[:tweets_pal_clafe])
        format.html { redirect_to @tweets_pal_clafe, notice: 'Tweets pal clafe was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tweets_pal_clafe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tweets_pal_claves/1
  # DELETE /tweets_pal_claves/1.json
  def destroy
    @tweets_pal_clafe = TweetsPalClafe.find(params[:id])
    @tweets_pal_clafe.destroy

    respond_to do |format|
      format.html { redirect_to tweets_pal_claves_url }
      format.json { head :no_content }
    end
  end
end
