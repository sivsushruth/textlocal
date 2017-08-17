# TextLocal

TextLocal API for elixir


## Installation

The package can be installed by adding `text_local` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:text_local, "~> 0.1.0"}]
end
```

## Usage


```
TextLocal.send!("123456789", "message content")
TextLocal.send!(["123456789", "4567890123"], "message content", %{test: true})
```

### Config

```
config :text_local,
  api_key: "XXX",
  sender: "SENDR"

# or

config :text_local,
  hash: "XXX",
  sender: "SENDR",
  username: "a@b.com",
  test: true

```

Made with love at [Farmizen](http://farmizen.com/).
