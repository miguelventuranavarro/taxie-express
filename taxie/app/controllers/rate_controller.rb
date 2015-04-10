class RateController < ApplicationController
  def index
  	@districts = District.all  	
  	@zones = Zone.where("district_id = ?", District.first.id)
    @car_types = CarType.all  
  end


  def update_zones
    @zones = Zone.where("district_id = ?", params[:district_id])
    respond_to do |format|
     format.js
    end
  end  


  def update_zones_2
    @zones_2 = Zone.where("district_id = ?", params[:district_id])
    respond_to do |format|
     format.js
    end
  end 

  def show
    @district_o = District.find_by("id =?", params[:rate][:district_o])
    @zone_o = Zone.find_by("id =?", params[:rate][:zone_o])
    @district_d = District.find_by("id =?", params[:rate][:district_d])
    @zone_d = Zone.find_by("id =?", params[:rate][:zone_d])

    #@rate = Rate.find_by("zone_id_o = ?", params[:rate][:zone_o])
    @rate = Rate.find_by(["zone_o_id = ? AND zone_d_id = ?", params[:rate][:zone_o], params[:rate][:zone_d]])
  end

 
end
