class PageController < ApplicationController

  def index
      @sort = Event.order('when_date ASC')

  end

  def about

  end


end