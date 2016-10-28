module ApplicationHelper

  def alert_type(type)
    if type == 'notice'
      'ui info message'
    else
      'ui negative message'
    end
  end
  def apply_set_options
    records = [].tap do |t|
      ApplySet.show_records.each do |e|
        t << e
      end
    end
    records << @written_apply.apply_set unless @written_apply.id.nil?
    records.map{|m|[m.comment,m.id]}
  end

  include SendMenu
  
end
