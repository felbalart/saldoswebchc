class FotoController < ActionController::Base
  def image
    data = device_service.take_image
    device_service.disconnect
    send_data(data,
      type: 'image/jpg',
      disposition: 'inline')
  end

  private
  
  def device_service
    @device_service ||= DeviceControlService.new
  end
end
