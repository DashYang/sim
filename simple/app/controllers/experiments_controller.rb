class ExperimentsController < ApplicationController
    before_action :require_admin

    def new
        @experiment = Experiment.new
    end
    
    def create
        @experiment = Experiment.new(allowed_params)
        if @experiment.save
            redirect_to '/', notice: "Successfully created exp."
            else
            render :new
        end
    end
    

    
    private
    
    def allowed_params
        params.require(:experiment).permit!
    end
end
