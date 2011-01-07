class TermekeksController < ApplicationController
  # GET /termekeks
  # GET /termekeks.xml
  def index
    @termekeks = Termekek.find(:all, :order=>'cikkszam')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @termekeks }
    end
  end

  # GET /termekeks/1
  # GET /termekeks/1.xml
  def show
    @termekek = Termekek.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @termekek }
    end
  end

  # GET /termekeks/new
  # GET /termekeks/new.xml
  def new
    @termekek = Termekek.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @termekek }
    end
  end

  # GET /termekeks/1/edit
  def edit
    @termekek = Termekek.find(params[:id])
  end

  # POST /termekeks
  # POST /termekeks.xml
  def create
    @termekek = Termekek.new(params[:termekek])

    respond_to do |format|
      if @termekek.save
        format.html { redirect_to(@termekek, :notice => 'Termekek was successfully created.') }
        format.xml  { render :xml => @termekek, :status => :created, :location => @termekek }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @termekek.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /termekeks/1
  # PUT /termekeks/1.xml
  def update
    @termekek = Termekek.find(params[:id])

    respond_to do |format|
      if @termekek.update_attributes(params[:termekek])
        format.html { redirect_to(@termekek, :notice => 'Termekek was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @termekek.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /termekeks/1
  # DELETE /termekeks/1.xml
  def destroy
    @termekek = Termekek.find(params[:id])
    @termekek.destroy

    respond_to do |format|
      format.html { redirect_to(termekeks_url) }
      format.xml  { head :ok }
    end
  end
end
