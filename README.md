# Sinatra::JSHlp

Helpers for js and css assets in [Sinatra](https://github.com/sinatra/sinatra) applications.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sinatra-jshlp'

```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sinatra-jshlp

## Usage

In Classic Applications

```ruby
# app.rb
require 'sinatra'
require 'sinatra-jshlp'

#...
```

In Modular Applications

```ruby
# app.rb
require 'sinatra/base'
require 'sinatra-jshlp'

class MyApp < Sinatra::Base
  register Sinatra::JSHlp
  
  # ...
  
end
```

### JS and CSS from view to layout

Simple layout
```erb
<html>
<head>
  <link rel="stylesheet" href="/css/style.css" />
  <%= stylesheets %>
</head>
<body>

  <%= yield %>
  
  <script src="/js/script.js"></script>
  <%= javascripts %>
</body>
</html>
```

Connect js and css in view
```erb
<%
  jscode "alert('Hello from Main Page!');"
  jslink '/lib/dateplugin.js'
  jslink '/js/mainpage.js'
  csslink '/css/mainpage.css'
  jscode "alert('Thanx you!');"
%>
<h1>Main Page</h1>
```

Result HTML
```html
<html>
<head>
<link rel="stylesheet" href="/css/style.css" />
<link rel="stylesheet" href="/css/mainpage.css" />
</head>
<body>
  <h1>Main Page</h1>
  <script src="/js/script.js"></script>
  <script src="/js/mainpage.js"></script>
  <script src="/js/dateplugin.js"></script>
  <script>
    alert("Hello from Main Page!");
    alert('Thanx you!');
  </script>
</body>
</html>
```

### Duplicate links

If you connect several times the JS or CSS file, in html once it connects.
```erb
# view.erb
<%
  jslink '/lib/jslib.js'
  jslink '/lib/jslib.js'
  jslink '/lib/jslib.js'
%>
```
HTML Result
```html
...
<body>
...
<script src="/js/script.js"></script>
<script src="/lib/jslib.js"></script>
</body>
...
```

### Dividing javascripts
It is possible to split the output code.
```erb
<%= javascripts %>

analog of

<%= jslinks %>
<%= jscodes %>

```

### JS library

TODO This functionality

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/xtsidx/sinatra-jshlp/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

