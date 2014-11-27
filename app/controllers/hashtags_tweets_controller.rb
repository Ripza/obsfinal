class HashtagsTweetsController < ApplicationController
  # GET /hashtags_tweets
  # GET /hashtags_tweets.json
  def index
    @hashtags_tweets = HashtagsTweet.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @hashtags_tweets }
    end
  end

  # GET /hashtags_tweets/1
  # GET /hashtags_tweets/1.json
  def show
    @hashtags_tweet = HashtagsTweet.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @hashtags_tweet }
    end
  end

  # GET /hashtags_tweets/new
  # GET /hashtags_tweets/new.json
  def new
    @hashtags_tweet = HashtagsTweet.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @hashtags_tweet }
    end
  end

  # GET /hashtags_tweets/1/edit
  def edit
    @hashtags_tweet = HashtagsTweet.find(params[:id])
  end

  # POST /hashtags_tweets
  # POST /hashtags_tweets.json
  def create
    @hashtags_tweet = HashtagsTweet.new(params[:hashtags_tweet])

    respond_to do |format|
      if @hashtags_tweet.save
        format.html { redirect_to @hashtags_tweet, notice: 'Hashtags tweet was successfully created.' }
        format.json { render json: @hashtags_tweet, status: :created, location: @hashtags_tweet }
      else
        format.html { render action: "new" }
        format.json { render json: @hashtags_tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /hashtags_tweets/1
  # PUT /hashtags_tweets/1.json
  def update
    @hashtags_tweet = HashtagsTweet.find(params[:id])

    respond_to do |format|
      if @hashtags_tweet.update_attributes(params[:hashtags_tweet])
        format.html { redirect_to @hashtags_tweet, notice: 'Hashtags tweet was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @hashtags_tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hashtags_tweets/1
  # DELETE /hashtags_tweets/1.json
  def destroy
    @hashtags_tweet = HashtagsTweet.find(params[:id])
    @hashtags_tweet.destroy

    respond_to do |format|
      format.html { redirect_to hashtags_tweets_url }
      format.json { head :no_content }
    end
  end
end
