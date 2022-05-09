class ProcessFixedAssetsForm

def run(fp)
  # fp = params.symbolize_keys
  duser_params = fp.slice(:names,:last_name1 ,:last_name2 ,:rut,:workplace,:email,:mobile_phone_num ,:mobile_line_owner,:mobile_device_owner,:fixed_device_num, :area)
  @duser = Duser.create!(duser_params)

  try_create_device(devtype: 'mobile', brand: fp[:mobile1_brand], model: fp[:mobile1_model], color: fp[:mobile1_color] )
  try_create_device(devtype: 'mobile', brand: fp[:mobile2_brand], model: fp[:mobile2_model], color: fp[:mobile2_color] )
  try_create_device(devtype: 'mobile', brand: fp[:mobile3_brand], model: fp[:mobile3_model], color: fp[:mobile3_color] )
  try_create_device(devtype: 'mobile', brand: fp[:mobile4_brand], model: fp[:mobile4_model], color: fp[:mobile4_color] )

  try_create_device(devtype: 'pc', subtype: fp[:pc1_type], brand: fp[:pc1_brand], model: fp[:pc1_model], color: fp[:pc1_color] )  
  try_create_device(devtype: 'pc', subtype: fp[:pc2_type], brand: fp[:pc2_brand], model: fp[:pc2_model], color: fp[:pc2_color] )  
  try_create_device(devtype: 'pc', subtype: fp[:pc3_type], brand: fp[:pc3_brand], model: fp[:pc3_model], color: fp[:pc3_color] )  
  try_create_device(devtype: 'pc', subtype: fp[:pc4_type], brand: fp[:pc4_brand], model: fp[:pc4_model], color: fp[:pc4_color] )  

  try_create_device(devtype: 'monitor', brand: fp[:monitor1_brand], model: fp[:monitor1_model], color: fp[:monitor1_color] )
  try_create_device(devtype: 'monitor', brand: fp[:monitor2_brand], model: fp[:monitor2_model], color: fp[:monitor2_color] )

  try_create_device(devtype: 'printer', subtype: fp[:printer1_type], brand: fp[:printer1_brand], model: fp[:printer1_model])
  try_create_device(devtype: 'printer', subtype: fp[:printer2_type], brand: fp[:printer2_brand], model: fp[:printer2_model])
  try_create_device(devtype: 'printer', subtype: fp[:printer3_type], brand: fp[:printer3_brand], model: fp[:printer3_model])

  try_create_device(devtype: 'other', brand: fp[:other1])
  try_create_device(devtype: 'other', brand: fp[:other2])
  try_create_device(devtype: 'other', brand: fp[:other3])
  try_create_device(devtype: 'other', brand: fp[:other4])
  return @duser
end

def try_create_device(dp)
  d = Device.new(dp)
  return if d.devtype == 'mobile' && d.brand.blank? && d.model.blank? && d.color.blank?
  return if d.devtype == 'pc' && d.brand.blank? && d.model.blank? && d.color.blank?
  return if d.devtype == 'monitor' && d.brand.blank? && d.model.blank? && d.color.blank?
  return if d.devtype == 'printer' && d.brand.blank? && d.model.blank? && d.color.blank?
  return if d.devtype == 'other' && d.brand.blank? && d.model.blank? && d.color.blank?

  d.duser = @duser
  d.save!
  end
end