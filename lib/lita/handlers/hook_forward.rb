module Lita
  module Handlers
    class HookForward < Handler

      #noinspection RubyArgCount
      http.get '/lita/hook-forward', :receive
      http.post '/lita/hook-forward', :receive

      def self.default_config(handler_config)
        handler_config.default_room = nil
      end

      def receive(request, response)
        message = request.params['message']
        targets = request.params['targets'] || Lita.config.handlers.hook_forward.default_room || nil
        target_names = []

        targets.split(',').each do |param_target|
          target_names << param_target
        end

        target_names.each do |name|
          target = if name[0] == '#'
                     name = name[1..-1]
                     lita_room = Lita::Room.find_by_name(name)
                     Lita::Source.new(room: lita_room.id)
                   else
                     user = Lita::User.fuzzy_find(name)
                     Lita::Source.new(user: user)
                   end

          robot.send_message(target, message)
        end
      end
    end

    Lita.register_handler(HookForward)
  end
end
