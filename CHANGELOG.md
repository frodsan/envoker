2.0.2 (15-04-2016)
------------------

- Bump rake version to 11.0.

2.0.1 (06-04-2016)
------------------

- No changes.

2.0.0 (29-11-2015)
------------------

- Add support for Rack environments.

  ```ruby
  ENV["RACK_ENV"] = "test"

  # This will load `.env` and `.env.test`
  Envoker::Rack.load
  ```

- Add support to override settings.

  ```ruby
  require "envoker"

  Envoker.load(".env")
  Envoker.overload(".env.local")
  ```

- Breaking change: Remove `Envoker#fetch`.
