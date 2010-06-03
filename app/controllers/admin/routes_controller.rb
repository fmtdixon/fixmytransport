class Admin::RoutesController < ApplicationController
  
  layout "admin" 

  def show
    @route = Route.find(params[:id])
  end
  
  def index
    conditions = []
    if params[:mode]
      conditions = ["transport_mode_id = ?", params[:mode]]
    end
    @routes = Route.paginate :page => params[:page], 
                             :conditions => conditions, 
                             :order => 'created_at DESC'
  end
  
  def update
    @route = Route.find(params[:id])
    if @route.update_attributes(params[:route])
      flash[:notice] = t(:route_updated)
      redirect_to admin_route_url(@route)
    else
      flash[:error] = t(:route_problem)
      render :show
    end
  end

end
