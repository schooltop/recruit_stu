module ApplicationHelper

  def alert_type(type)
    if type == 'notice'
      'ui info message'
    else
      'ui negative message'
    end
  end
  
end
