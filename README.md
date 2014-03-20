# lita-hook-forward

 [![Build Status](https://travis-ci.org/milo-ft/lita-hook-forward.png)](https://travis-ci.org/milo-ft/lita-hook-forward)
 [![Code Climate](https://codeclimate.com/github/milo-ft/lita-hook-forward.png)](https://codeclimate.com/github/milo-ft/lita-hook-forward)
 [![Coverage Status](https://coveralls.io/repos/milo-ft/lita-hook-forward/badge.png)](https://coveralls.io/r/milo-ft/lita-hook-forward)

**lita-hook-forward** is a simple [Lita](https://github.com/jimmycuadra/lita) handler that will forward any message coming from a hook.

## Installation

Add **lita-hook-forward** to your Lita instance's Gemfile:

``` ruby
gem "lita-hook-forward"
```

## Configuration

### Required attributes

* `default_room` (String) - The default room or rooms (comma separated).
i.e.: `#general`.

### Example

``` ruby
Lita.configure do |config|
  config.handlers.hook_forwarder.default_room = '#general'
end
```

## Usage

```
http://.slackserver/lita/hook-forward?targets=%23&message=Hello%20everyone
```

## License

[MIT](http://opensource.org/licenses/MIT)
