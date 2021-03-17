module ApplicationHelper
  def spanish_month(month_number)
    case month_number
    when 1; 'enero'
    when 2; 'febrero'
    when 3; 'marzo'
    when 4; 'abril'
    when 5; 'mayo'
    when 6; 'junio'
    when 7; 'julio'
    when 8; 'agosto'
    when 9; 'septiembre'
    when 10; 'octubre'
    when 11; 'noviembre'
    when 12; 'diciembre'
    end
  end
end
