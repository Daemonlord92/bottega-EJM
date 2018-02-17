class PortfoliosController < ApplicationController
  before_action :set_portfolio_item, only: [:edit, :update, :destroy, :show]
  layout "portfolio"
  access all: [:show, :index, :python, :rails], user: {except: [:destroy, :new, :create, :update, :edit]}, site_admin: :all
    def index
        @portfolio_items = Portfolio.by_position
    end
    def python
      @python_portfolio_items = Portfolio.python
    end
    def rails
      @rails_portfolio_items = Portfolio.rails
    end
    
    def new
       @portfolio_item = Portfolio.new 
       3.times{ @portfolio_item.technologies.build }
    end
    
    def create
      @portfolio_item = Portfolio.new(portfolio_params)
    
        respond_to do |format|
          if @portfolio_item.save
            format.html { redirect_to portfolios_path, notice: 'Your portfolio item is now live.' }
           else
             format.html { render :new }
          end
        end
    end
    def edit

      
    end
    
    def update
    
      respond_to do |format|
        if @portfolio_item.update(portfolio_params)
          format.html { redirect_to portfolios_path, notice: 'The record successfully updated.' }
        else
          format.html { render :edit }
        end
      end
    end
    def show
     
    end
    def destroy
      
  
      # Destroy/delete the record
      @portfolio_item.destroy
      
      #redirect
      respond_to do |format|
        format.html { redirect_to portfolios_url, notice: 'Record was removed!' }
      end
    end
    
    private
    
    def set_portfolio_item
      @portfolio_item = Portfolio.find(params[:id])
    end
    
    def portfolio_params
      params.require(:portfolio).permit(:title,
                                        :subtitle,
                                        :body,
                                         technologies_attributes: [:name]
                                       )
    end
end
