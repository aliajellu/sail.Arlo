class QueryController < ApplicationController
  respond_to :html, :json, :xml
  
  # GET/POST
  def index
    @query_language = params[:lang] ? params[:lang] : 'ruby'
    @query_result_type = params[:result_type] ? params[:result_type] : 'json'
    @query_string = params[:query] ? params[:query] : ''
    
    
    respond_to do |format|
      format.any(:html, :xml, :json)  { 
        begin
          @query_results = eval(@query_string)
          
          response = {:status => :success, :query => @query_string, :count => @query_results.count, :payload => @query_results, }
          render @query_result_type.to_sym => response
        rescue Exception => e
          response = {:status => :error, :payload => e.to_s, :stack =>e.backtrace, :query => @query_string}
          render @query_result_type.to_sym => response
        end
      }
    end
  end
end
