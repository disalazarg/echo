# Echo

Echo is a small web server that receives any request, logs basic parameters from it, and replies back with either the same data or a precrafted JSON response. It is meant to be used for debugging web clients and little else.

## Installation

It does not have any dependency outside Crystal's standard library, so a simple `crystal build src/echo.cr` inmediately after cloning should suffice.

## Usage

Echo accepts a few command-line parameters, listed with `./echo -h`. They're as follows:

    -p PORT, --port PORT             Specify port to use
    -c, --cors                       Enable CORS headers
    -j FILE, --json FILE             Loads a JSON reply
    -h, --help                       Shows this help

## Contributing

1. Fork it ( https://github.com/disalazarg/echo/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [[disalazarg]](https://github.com/disalazarg) Daniel Salazar - creator, maintainer
