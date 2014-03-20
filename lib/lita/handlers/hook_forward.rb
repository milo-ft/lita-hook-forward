module Lita
  module Handlers
    class HookForward < Handler

      #noinspection RubyArgCount
      http.get '/lita/hook-forward', :receive

      def self.default_config(handler_config)
        handler_config.default_room = nil
      end

      def receive(request, response)
        message = request.params['message']
        targets = request.params['targets'] || Lita.config.handlers.hook_forward.default_room || nil
        rooms = []
        targets.split(',').each do |param_target|
          rooms << param_target
        end
        rooms.each do |room|
          target = Source.new(room: room)
          robot.send_message(target, message)
        end
      end
    end

    Lita.register_handler(HookForward)
  end
end
