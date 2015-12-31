Envoker [![Build Status](https://travis-ci.org/frodsan/envoker.svg)](https://travis-ci.org/frodsan/envoker)
=======

Load environment variables from `.env` files.

Installation
------------

Add this line to your application's Gemfile:

```ruby
gem "envoker"
```

And then execute:

```
$ bundle
```

Or install it yourself as:

```
$ gem install envoker
```

Usage
-----

Load your `.env` file in the application bootstrap
process:

```ruby
# .env
RACK_ENV=development

# boot.rb
require "envoker"

Envoker.load

ENV["RACK_ENV"]
# => "development"
```

You can use `Envoker#overload` to override
existing values in `ENV`:

```ruby
# .env.test
RACK_ENV=test

# boot.rb
# ...

Envoker.overload(".env.test")

ENV["RACK_ENV"]
# => "test"
```

Multiple Environments
---------------------

`Envoker::Rack` adds support for multiple environments:

```ruby
require "envoker/rack"

Envoker::Rack.load
```

You should store env vars that are general to
all environments in `.env`, and store specific
env vars in `.env.<environment>`.The default
environment is `development`, but can be changed
through `ENV["RACK_ENV"]`.

```ruby
ENV["RACK_ENV"] = "test"

# This will load `.env` and `.env.test`
Envoker::Rack.load
```

Settings
--------

This is a common pattern I use in my applications:

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

Contributing
------------

Fork the project with:

```
$ git clone git@github.com:frodsan/envoker.git
```

To install dependencies, use:

```
$ bundle install
```

To run the test suite, do:

```
$ rake test
```

For bug reports and pull requests use [GitHub][issues].

License
-------

Envoker is released under the [MIT License][mit].

[mit]: http://www.opensource.org/licenses/MIT
[issues]: https://github.com/frodsan/envoker/issues
