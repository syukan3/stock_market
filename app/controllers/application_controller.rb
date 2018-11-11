class ApplicationController < ActionController::Base

#   protect_from_forgery with: :exception
  # before_action :configure_permitted_parameters, if: :devise_controller?
  #
  # protected
  # 　　def configure_permitted_parameters
  #     added_attrs = [ :email, :available, :password, :password_confirmation　]
  #     devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
  #     devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  #     devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
  #   end

  # require 'gnuplot'
  #
  # Gnuplot.open do |gp|
  #   Gnuplot::SPlot.new(gp) do |plot|
  #     plot.terminal "png"
  #     plot.output   "sqrt.png"
  #     plot.set "isosamples 50,50"
  #     plot.set "pm3d at b"
  #     plot.data << Gnuplot::DataSet.new("sin(sqrt(x*x+y*y))/sqrt(x*x+y*y)")
  #   end
  #   gets
  # end

end
