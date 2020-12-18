class ScientistsController < ApplicationController
    
    def index
        @scientists = Scientist.all
    end

    def show
        @scientist = Scientist.find(params[:id])
    end 

    def new
        @scientist = Scientist.new
        @scientists = Scientist.all 
    end 

    def create
        scientist = Scientist.create(scientist_params)
        if scientist.valid?
            redirect_to scientist_path(scientist)
        else 
            flash[:errors] = scientist.errors.full_messages
            redirect_to new_scientist_path
        end
    end 

    def edit
        @scientist = Scientist.find(params[:id])
    end

    def destroy
        @scientist = Scientist.find(params[:id])
        @scientist.destroy

        redirect_to scientists_path
    end

    def update
        scientist = Scientist.find(params[:id])
        scientist.update(scientist_params)
        
        if scientist.valid?
            redirect_to scientist_path(scientist)
        else 
            flash[:errors] = scientist.errors.full_messages
            redirect_to edit_scientist_path(scientist)
        end 

    end

    private

    def scientist_params
        params.require(:scientist).permit(:name, :field_of_study)
    end
end
