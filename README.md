envoker
=======

Load environment variables from `.env` files.

Usage
-----

Load your `.env` file in the application bootstrap
process:

```ruby
# .env
REDIS_URL=redis://localhost:6379

# boot.rb
require "envoker"

Envoker.load

ENV["REDIS_URL"]
# => REDIS_URL=redis://localhost:6379
```

```ruby
require "envoker/rack"

Envoker::Rack.load
```

This is a common pattern we use in our applications:

```ruby
require "envoker/rack"

Envoker::Rack.load

module Settings
  def self.fetch(key)
    return ENV.fetch(key) do
      raise(sprintf("ENV[%p] not found", key))
    end
  end

  REDIS_URL = fetch("REDIS_URL")
  SMTP_URL  = fetch("SMTP_URL")
end

Settings::SMTP_URL
# => redis://localhost:6379
```

Installation
------------

```
$ gem install envoker
```
