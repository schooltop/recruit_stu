var check_package_count_readonly = function(element,package_type){
  var parentDiv = $(element).parents('.J_package_group');
  var count_element = $(".J_package_count", parentDiv);
  var package_element = $(".J_package", parentDiv);
  if(package_type == '0'){
    var s = count_element.val() * package_element.val();
    if (s){
      package_element.val(s);
    }
    count_element.val('1');
    count_element.attr("readonly","readonly");
  }else{
    count_element.removeAttr("readonly");
  }
};
