class PagesController < ApplicationController
  def home
  end

  def products
  	@termekek=Termekek.find(:all, :select=> "megnev, count(*) as db", :group=>"megnev")
  end
  
  def termekmut
  	@termekek=Termekek.find_all_by_megnev(params[:m])
  end

  def contact
  end

end
