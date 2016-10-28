module ApplicationHelper

  def alert_type(type)
    if type == 'notice'
      'ui info message'
    else
      'ui negative message'
    end
  end
  def apply_set_options
  	ApplySet.show_records.map{|m|[m.comment,m.id]}
  end

  include SendMenu
  
end
