class PagesController < ApplicationController
  def index
  	@pages = Page.all
  end

  def show
  	@page = Page.find(params[:id])
  end

  def new
  	@page = Page.new
  end

  def create
  	@page = Page.new(page_params)

  	if @page.save
  		flash[:notice] = "Page created successfully"
  	  redirect_to(pages_path)
  	else
      render('new')
  	end
  end

  def edit
  	@page = Page.find(params[:id])
  end

  def update
  	@page = Page.find(params[:id])
  	if @page.update_attributes(page_params)
  		flash[:notice] = "Page editted successfully"
  		redirect_to(page_path(@page))
  	else
  		render('edit')
  	end
  end

  def delete
  	@page = Page.find(params[:id])
  end

  def destroy
  	@page = Page.find(params[:id])
  	@page.destroy
  	flash[:notice] = "Page '#{@page.name}' destroyed successfully"
  	redirect_to(pages_path)
  end

  private

  def page_params
  	params.require(:page).permit(:name, :permalink, :position, :visible, :subject_id)
  end
end