###
# this Mustafa UserControl class powered by Bootstrap!
# 
# support basic implementation for bootstrap
###
module MustafaControl
    
    ###
    # Bootstrap Panel
    ###
    class Panel < Core::Control 
        init_property "panel_type"
        init_property "title"
        init_property "content"

        init " panel_type: \"success\", title: \"Title\", content: \"Content\" "

        ##macrosu yazılacak
        def show(**properties)
            "<div class=\"panel panel-#{control_property("panel_type")}\"><div class=\"panel-heading\">#{control_property("title")}</div><div class=\"panel-body\">#{control_property("content")}</div></div>"
        end
    end

    ###
    # Bootstrap Panel
    ###
    class Panel < Core::Control 
        init_property "panel_type"
        init_property "title"
        init_property "content"

        init " panel_type: \"success\", title: \"Title\", content: \"Content\" "

        ##macrosu yazılacak
        def show(**properties)
            "<div class=\"panel panel-#{control_property("panel_type")}\"><div class=\"panel-heading\">#{control_property("title")}</div><div class=\"panel-body\">#{control_property("content")}</div></div>"
        end
    end

    ###
    # Bootstrap Alert
    ###
    class Alert < Core::Control 
        init_property "text"
        init_property "alert_type"

        init " text: \"Text\", alert_type: \"primary\" "

        ##macrosu yazılacak
        def show(**properties)
            "<div class=\"alert alert-#{control_property("alert_type")}\" role=\"alert\">#{control_property("text")}</div>"
        end
    end

    ###
    # Bootstrap Badge
    ###
    class Badge < Core::Control 
        init_property "lbl_type"
        init_property "text"
        init_property "badge_text"

        init " lbl_type: \"primary\", text: \"Text\", badge_text: \"Text\" "

        ##macrosu yazılacak
        def show(**properties)
            "<button class=\"btn btn-#{control_property("lbl_type")}\" type=\"button\">#{control_property("text")} <span class=\"badge\">#{control_property("badge_text")}</span></button>"
        end
    end
end