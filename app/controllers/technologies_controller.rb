class TechnologiesController < ApplicationController
  before_action :set_technology, only: %i[ show edit update destroy toggle_status]
  access all: [:show, :index], site_admin: :all

  layout "technology"
    def index
        @technologies = Technology.all 
        @page_title = "My Technologies"
    end

    def new
        @technologies = Technology.new
        3.times { @technologies.items.build }
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
      @page_title = @technology.title
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
      @page_title = @technology.title
    end 
 
    def destroy 
        @technology.destroy
    
        respond_to do |format|
          format.html { redirect_to technologies_url, notice: "Tech news was successfully destroyed." }
        end
    end


  def toggle_status
    
    if @technology.draft?
      @technology.published!
    elsif @technology.published?
      @technology.draft!
    end
    redirect_to technologies_url
  end

    private

    def technology_params
        params.require(:technology).permit(:title, :subtitle, :body, :main_image, :thumb_image, items_attributes: [:name])
    end

    def set_technology
      @technology = Technology.find(params[:id])
    end
end
