class DemoController < ApplicationController
  
  layout 'application'
  
  def index
    @id = params['id']
    @page = params['page']
  end

  def hello
    @array = [1,2,3,4,5]
  end

  def other_hello
    redirect_to('http://www.google.com')
  end

  def escape_output
  end

end
