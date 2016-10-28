module SendMenu

   SiteTabs = %w[left top minit]
   SiteTabs.each { |m| define_method("#{m}_tab") {session["#{m}_tab".to_sym] = request.path} }
   
   SiteTabs.each do |m|
    define_method("#{m}_title_select") do |*arg|
      title,link = arg[0],arg[1]
      title_select title,link,session["#{m}_tab".to_sym],m
    end
   end

   def title_select(tab_title,link,sess,m)
       active = link != sess ? "" : "active"
       if m == "left"
          if active == "active"
             "<li class='active'>
            <a href='#{link}' title='#{tab_title}' >#{tab_title}</a>
            <span class='arrow'>>></span></li>"
          else
             "<li>
               <a href='#{link}' title='#{tab_title}' >#{tab_title}</a>
               <span class='arrow'></span>
            </li>"
          end
       elsif m == "top"
           "<li class='#{active}'>
                  <div class='title'>
                    <div class='name'>
                      <a href='#{link}' title='#{tab_title}' ><font size='4px'>#{tab_title}</font></a>
                    </div>
                    </div>
                  </li>
              "
       elsif m == "minit"
           "<li id='#{tab_title}' class='#{active}'><a href='#{link}' title='#{tab_title}' >#{tab_title}</a></li>"    
       end
   end

end