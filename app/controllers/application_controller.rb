class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #   def parse
		# file = Roo::Excel.new('/Users/mandeepbrar/Desktop/test.xlsx')
  #   end

end
