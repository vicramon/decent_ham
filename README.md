# Decent Ham

Decent Ham generates crud for rails apps using decent_exposure and haml.

## Installation

Add this line to your application's Gemfile:

    gem 'decent_ham'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install decent_ham

## Usage

First create and run a migration. Then, run the following code in your console:

```
$ rails generate decent_ham <resource_name> 
```

Fill in `<resource_name>` with whatever your resource is (e.g. users, posts, etc.)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
