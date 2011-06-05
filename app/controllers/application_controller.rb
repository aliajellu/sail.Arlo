class ApplicationController < ActionController::Base
  protect_from_forgery
  respond_to :json, :xml, :only => [:index, :show, :new, :edit, :create, :update, :destroy]
  respond_to :html

  # helper methods 
  
  def _collection_name
    return controller_name.singularize.camelize
  end
  
  def _create_collection
    return _collection_name.constantize
  end
  
  def _view_exists (relative_view_path)
    return FileTest.exists?('app/views/' + relative_view_path + '.erb')
  end
  
  def _render_view (objects)
    format = request.params[:format]
    
    if format == 'html' or format.blank?
      relative_view_path = controller_name + '/' + action_name
      
      if _view_exists relative_view_path
        render relative_view_path
      else
        render 'application/' + action_name
      end
    else
      render format.to_sym => objects
    end
  end







  # API Methods

  def index
    @collection = _create_collection
    @objects = @collection.all
    
    _render_view @objects
  end

  def show
    respond_to do |format|
      begin
        @obj = _create_collection.find(params[:id])
        format.any(:html, :xml, :json) {
          _render_view @obj
        }        
      rescue => e
        format.html { render :action => "index", :notice => e.to_s }
        format.any(:xml, :json) {
          response = {:status => :error, :payload => e.to_s, :stack =>e.backtrace}
          _render_view response
        }
      ensure
        # nothing
      end
    end
  end

  # GET
  def new
    respond_to do |format|
      begin
        @obj = _create_collection.new
        format.any(:html, :xml, :json) {
          _render_view @obj
        }        
      rescue => e
        format.html { render :action => "index", :notice => e.to_s }
        format.any(:xml, :json) {
          response = {:status => :error, :payload => e.to_s, :stack =>e.backtrace}
          _render_view response
        }
      ensure
        # nothing
      end
    end
  end

  # POST
  def create
    @collection = _create_collection

    respond_to do |format|
      begin
        logger.info "looking for " + _collection_name.underscore
        @obj = @collection.new(params[_collection_name.underscore])
        
        if @obj.save
          format.html { redirect_to(@obj, :notice => 'Object was successfully created.') }
          format.any(:xml, :json) { 
            response = {:status => :success, :payload => @obj}
            _render_view response
          }
        else
          format.html { render :action => "new" }
          format.any(:xml, :json) {
            response = {:status => :error, :payload => @obj.errors}
            _render_view response
          }
        end
      rescue => e
        format.html { render :action => "new" }
        format.any(:xml, :json) {
          response = {:status => :error, :payload => e.to_s, :stack =>e.backtrace}
          _render_view response
        }
      ensure
        # nothing
      end
    end
  end

  # GET
  def edit
    respond_to do |format|
      begin
        @obj = _create_collection.find(params[:id])
        format.any(:html, :xml, :json) {
          _render_view @obj
        }        
      rescue => e
        format.html { render :action => "index", :notice => e.to_s }
        format.any(:xml, :json) {
          response = {:status => :error, :payload => e.to_s, :stack =>e.backtrace}
          _render_view response
        }
      ensure
        # nothing
      end
    end
  end
  
  # PUT
  def update
    @collection = _create_collection

    respond_to do |format|
      
      begin
        @obj = @collection.find(params[:id])
        
        if @obj.update_attributes(params[_collection_name.underscore])
          format.html { redirect_to(@obj, :notice => 'Object was successfully updated.') }
          format.any(:xml, :json) { 
            response = {:status => :success, :payload => @obj}
            _render_view response
          }
        else
          format.html { render :action => "edit" }
          format.any(:xml, :json) {
            response = {:status => :error, :payload => @obj.errors}
            _render_view response
          }
        end
      rescue => e
        format.html { render :action => "edit" }
        format.any(:xml, :json) {
          response = {:status => :error, :payload => e.to_s, :stack =>e.backtrace}
          _render_view response
        }
      ensure
        # nothing
      end
    end
  end

  # DELETE
  def destroy
    @collection = _create_collection
     
    respond_to do |format|
      begin
        @obj = @collection.find(params[:id])
        @obj.destroy
      rescue => e
        format.html { redirect_to(@collection, :notice => 'Object could not be deleted.') }
        format.any(:xml, :json) {
          response = {:status => :error, :payload => e.to_s, :stack =>e.backtrace}
          _render_view response
        }
      end
      
      format.html { redirect_to(@obj, :notice => 'Object was deleted.') }
      format.any(:xml, :json)  { 
        response = {:status => :success, :payload => @obj}
        _render_view response
      }
    end
  end
end
