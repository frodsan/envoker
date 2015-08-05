envoker
=======

Load environment variables from .env file.

Usage
-----

This is a common pattern we use in our applications:

```ruby
require "envoker"

module Settings
  Envoker.load

  DATABASE_URL = Envoker.fetch("DATABASE_URL")
  RACK_ENV = Envoker.fetch("RACK_ENV", "development")

  # ...
end

puts(Settings::RACK_ENV)
# => "development"
```

Installation
------------

```
$ gem install envoker
```
