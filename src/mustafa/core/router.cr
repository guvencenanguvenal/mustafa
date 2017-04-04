require "http"

module Mustafa
  module Core
    ###
    # this class for register/load controller
    #
    # this class is singletone Mustafa::Core.route
    ###
    class Router
      INSTANCE = Router.new

      ###
      # Controller register and load methods
      # 
      # this method use polymorphysm
      ###
      def route_controller(context : HTTP::Server::Context)
        Helper.route.set_query_params context.request.method.to_s, context.request.query_params.to_s
        path_parse_array = Helper.route.path_split context.request.path
        Helper.route.set_url_params context.request.path

        if Helper.controller.__controllers.has_key? path_parse_array[0]
          controller_obj = Helper.controller.__controllers[path_parse_array[0]]
          controller_obj.run_action path_parse_array[1]

          _view = controller_obj.load_view
          context.response.content_type = _view.content_type
          context.response.status_code = _view.status_code
          context.response.print _view.to_s
        else
          context.response.status_code = 404
          context.response.print "404 Controller Bulunamadı"
        end
      end
    end

    def self.router
      yield Router::INSTANCE
    end

    def self.router
      Router::INSTANCE
    end

  end
end
