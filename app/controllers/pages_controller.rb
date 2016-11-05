class PagesController < ApplicationController

  layout 'admin'

  before_action :confirm_logged_in
  before_action :find_subjects, :only => [:new, :create, :edit, :update]
  before_action :set_page_count, :only => [:new, :create, :edit, :update]

  def index
  	@pages = Page.sorted
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
  	  @pages_count = Page.count + 1
      render('new')
  	end
  end

  def edit
  	@page = Page.find(params[:id])
  end

  def update
  	@page = Page.find(params[:id])
  	if @page.update_attributes(page_params)
  		flash[:notice] = "Page edited successfully"
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

  def find_subjects
    @subjects = Subject.sorted
  end

  def set_page_count
    @pages_count = Page.count
    if params[:action] == 'new' || params[:action] == 'create'
      @pages_count += 1
    end
  end
end
