
class PagesController < ApplicationController
  def home
  	@termekek=Leirasok.find(:all, :order=> "megnev")
  end
  
  def termekmut
  	if id=params[:id]
	  	@termek=Leirasok.find(id)
  	end
  end

  def contact
  end

end
