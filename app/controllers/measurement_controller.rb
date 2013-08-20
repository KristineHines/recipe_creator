class MeasurementController < ApplicationController


  private

  def measurement_params
    params.require(:measurement).permit(:name)
  end
end