envoker
=======

Load environment variables from `.env` files.

Usage
-----

This is a common pattern we use in our applications:

```ruby
require "envoker"

Envoker.load

Envoker.load(".env.local")

Envoker.overload(".env.local")
```

```ruby
require "envoker/rack"

Envoker::Rack.load
```

```ruby
require "envoker/rack"

Envoker::Rack.load

module Settings
  def self.fetch(key)
    return ENV.fetch(key) do
      raise(sprintf("ENV[%p] not found", key))
    end

    REDIS_URL = fetch("REDIS_URL")
    SMTP_URL  = fetch("SMTP_URL")
  end
end
```

Installation
------------

```
$ gem install envoker
```
