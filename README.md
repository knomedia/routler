# routler

[![Build Status](https://travis-ci.org/knomedia/routler.svg?branch=master)](https://travis-ci.org/knomedia/routler)

Convert your rails routes to a CSV for reporting, processing, etc.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'routler'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install routler

## Usage

`build` is the default command. You can leave it off, but everything is
documented on the `build` command.

```bash

$ routler help build

  NAME:

    build

  SYNOPSIS:

    routler build filename [options]

  DESCRIPTION:

    Builds CSV files for your rail routes. 'filename' is assumed to be a file that
    holds the output of a rake routes run.  If no filename is passed, routler will
    run rake routes in your cwd and use the contents out its output.

    build is the default command so you can actually drop the build argument in all
    of the following examples


  EXAMPLES:

    # run rake routes in cwd and output csv to stdout
    routler build

    # process input_file and write csv to stdout
    routler build input_file

    # process input_file and write csv to a file named routes.csv
    routler build input_file -o routes.csv

    # process input_file, write to stdout, print stats
    routler build input_file -s true

  OPTIONS:

    --output STRING
        output file path

    --stats BOOL
        output stats

```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/routler/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
