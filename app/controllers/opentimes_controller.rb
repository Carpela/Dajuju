class OpentimesController < ApplicationController
  # GET /opentimes
  # GET /opentimes.json
  def index
    @opentimes = Opentime.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @opentimes }
    end
  end

  # GET /opentimes/1
  # GET /opentimes/1.json
  def show
    @opentime = Opentime.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @opentime }
    end
  end

  # GET /opentimes/new
  # GET /opentimes/new.json
  def new
    @opentime = Opentime.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @opentime }
    end
  end

  # GET /opentimes/1/edit
  def edit
    @opentime = Opentime.find(params[:id])
  end

  # POST /opentimes
  # POST /opentimes.json
  def create
    @opentime = Opentime.new(params[:opentime])

    respond_to do |format|
      if @opentime.save
        format.html { redirect_to @opentime, :notice => 'Opentime was successfully created.' }
        format.json { render :json => @opentime, :status => :created, :location => @opentime }
      else
        format.html { render :action => "new" }
        format.json { render :json => @opentime.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /opentimes/1
  # PUT /opentimes/1.json
  def update
    @opentime = Opentime.find(params[:id])

    respond_to do |format|
      if @opentime.update_attributes(params[:opentime])
        format.html { redirect_to @opentime, :notice => 'Opentime was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @opentime.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /opentimes/1
  # DELETE /opentimes/1.json
  def destroy
    @opentime = Opentime.find(params[:id])
    @opentime.destroy

    respond_to do |format|
      format.html { redirect_to opentimes_url }
      format.json { head :ok }
    end
  end
end
