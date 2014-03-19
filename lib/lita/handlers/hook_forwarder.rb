module Lita
  module Handlers
    class HookForwarder < Handler

      #noinspection RubyArgCount
      http.get '/lita/hook-forwarder', :receive

      def receive(request, response)

        message = request.params['message']
        targets = request.params['targets'] || Lita.config.handlers.hook_forwarder.default_room || '#general'
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

    Lita.register_handler(HookForwarder)
  end
end
