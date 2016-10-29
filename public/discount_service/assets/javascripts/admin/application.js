//= require jquery
//= require jquery_ujs
//= require lodash.min
//= require semantic
//= require_tree ../semantic
//= require zUI
//= require moment
//= require data-confirm-modal-semantic-ui
//= require jquery.remotipart
//= require_tree .
//= require_self

$.fn.dropdown.settings.placeholder = false;
$.fn.calendar.settings.ampm = false;
$.fn.calendar.settings.text.days = ['日','一','二','三','四','五','六'];
$.fn.calendar.settings.text.months = ['一','二','三','四','五','六','七','八','九','十','十一','十二'];
$.fn.calendar.settings.text.monthsShort = ['一','二','三','四','五','六','七','八','九','十','十一','十二'];
$.fn.calendar.settings.formatter.dayHeader = function (date, settings) {
  var month = date.getMonth() + 1;
  var year = date.getFullYear();
  if (month < 10) { month = '0' + month;}
  return  '' + year + '-' + month;
};
$.fn.calendar.settings.formatter.date = function (date, settings) {
  if (!date) {
    return '';
  }
  var day = date.getDate();
  var month = date.getMonth() + 1;
  var year = date.getFullYear();
  if (month < 10) { month = '0' + month;}
  if (day < 10) { day = '0' + day;}
  return settings.type === 'year' ? year :
    settings.type === 'month' ?  '' + year + '-' + month :
     '' + year + '-' + month + '-' + day;
};
$.fn.calendar.settings.formatter.time = function (date, settings, forCalendar) {
  if (!date) {
    return '';
  }
  var hour = date.getHours();
  var minute = date.getMinutes();
  var ampm = '';
  if (settings.ampm) {
    ampm = ' ' + (hour < 12 ? settings.text.am : settings.text.pm);
    hour = hour === 0 ? 12 : hour > 12 ? hour - 12 : hour;
  }
  if (hour < 10) { hour = '0' + hour;}
  if (minute < 10) { minute = '0' + minute;}
  return '' + hour + ':'  + minute + ':00' + ampm;
};


var ajaxBar = function(obj,options){
  options['ov'] = obj.value;
  if(options['ov'] == '--blank--'){
    return ;
  }
  $.get('/admin/ajax_bar',options,function(data){data});
}

var ajaxBarShowModal = function(element){
    $(element).modal('setting', {autofocus: false,allowMultiple: true}).modal('show');
}

var ajaxBarHideModal = function(element){
    $(element).modal('setting', {autofocus: false}).modal('hide');
    $(element).remove();
}


$(function(){
  $('.message .close').on('click', function() {
  $(this).closest('.message').fadeOut();
  });

  $(document).on('click', '.J_close_pop', function(){
    $('.popup').css("cssText","display: none!important");
  });
  //头部菜单
  $('a[data-toggle="popup"]').each(function() {
    $(this).popup({
      popup: $(this).attr('data-content'),
      position: $(this).attr('data-position'),
      on: 'click'
    })
  });

  //显示隐藏菜单
  $('#showToggle').hide();
  $('#hideToggle').show();
  $('#hideToggle,#showToggle').click(function() {
    if($('#sideMenu').hasClass('close_menu')){
      $('#hideToggle').hide();
      $('#showToggle').show();
      $('#sideMenu').removeClass('close_menu').addClass('open_menu');
    }else{
      $('#showToggle').hide();
      $('#hideToggle').show();
      $('#verticalMenu .child').hide();
      $('#verticalMenu a').removeClass('active');
      $('#sideMenu').removeClass('open_menu').addClass('close_menu');
    }
  });

  //展开菜单
  $('#verticalMenu a').on('click', function() {
    if ($(this).next('.child').length > 0 && $('#sideMenu').hasClass('open_menu')) {
      if ($(this).hasClass('active')) {
        $('#verticalMenu a').removeClass('active');
        $('#verticalMenu .child').hide();
        $(this).removeClass('active');
        $(this).next('.child').hide();
      } else {
        $('#verticalMenu a').removeClass('active');
        $('#verticalMenu .child').hide();
        $(this).addClass('active');
        $(this).next('.child').show();
      }

    }
  });

  $('.close_menu li').hover(function(){
    $(this).siblings().removeClass('active');
    $(this).addClass('active');
  },function(){
    $(this).removeClass('active');
  });
  $('.popups').popup();
  $('select.dropdown').dropdown({placeholder: false});
  $("#verticalMenu li").each(function(){
      if($(this).find("div a").length < 1){
          $(this).remove();
      }
  });
    $('.button')
        .popup();
    $('i.icon')
        .popup();
    $('.icon').on('click', function() {
        $('.popup').css("cssText", "display: none!important");
    })

    $('.cas')
        .popup();


  $(".button-to-export-search-excel").click(function(){
    $(".button-to-export-search-excel").attr('href', window.location.pathname+'.xls'+window.location.search)
    $(".button-to-export-search-excel").attr('target', 'blank');
  });


  $('.button.dropdown').dropdown({on: 'hover', action: function(text, value) {}});



  

});


