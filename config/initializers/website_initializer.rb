"
website/ajax_bar/ajax_bar_controller
website/ajax_bar/ajax_bar_helper
website/ajax_bar/ajax_bar_model
".split(/\n/).each do |file|
  require file unless file.blank?
end


