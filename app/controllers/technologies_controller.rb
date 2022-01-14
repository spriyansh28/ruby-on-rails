class TechnologiesController < ApplicationController
    def index
        @technologies = Technology.all 
    end

    def new
        @technologies = Technology.new
    end

    def create
        @technologies = Technology.new(technology_params)
    
        respond_to do |format|
          if @technologies.save
            format.html { redirect_to technologies_path, notice: "New news was successfully created." }
          else
            format.html { render :new, status: :unprocessable_entity }
          end
        end
    end

    def edit 
        @technologies = Technology.find(params[:id])
    end

    def update

        @technologies = Technology.find(params[:id])

        respond_to do |format|
          if @technologies.update(technology_params)
            format.html { redirect_to technologies_path(@technologies), notice: "Tech news was successfully updated." }
          else
            format.html { render :edit, status: :unprocessable_entity }
          end
        end
    end

    def show
        @technology = Technology.find(params[:id]) 
    end 
 
    def destroy
        @technology = Technology.find(params[:id]) 
 
        @technology.destroy
    
        respond_to do |format|
          format.html { redirect_to technologies_url, notice: "Tech news was successfully destroyed." }
        end
    end

    private

    def technology_params
        params.require(:technology).permit(:title, :subtitle, :body, :main_image, :thumb_image)
    end
end
