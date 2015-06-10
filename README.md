# Pattern Generator [![Build Status](https://travis-ci.org/sungwoncho/pattern_generator.svg?branch=master)](https://travis-ci.org/sungwoncho/pattern_generator)

Pattern Generator lets you generate various Rails patterns and tests with a single
command.


## Install

In your Gemfile, add the gem in the development group.

```ruby
gem 'pattern_generator', group: :development
```

Run `bundle install` to install the gem.

Now you are ready to rock the pattern generator!


## Usage

```
rails generate [PATTERN_TYPE] [YOUR_FILE_NAME]
```

Here are usage examples.

### Service

```
rails generate service find_match
```

The above command will generate these two files.

*app/services/find_match_service.rb*
```ruby
class FindMatchService

  def initialize

  end

  def call

  end
end
```

*spec/services/find_match_service_spec.rb*
```ruby
require 'rails_helper'

RSpec.describe FindMatchService, type: :service do
  describe '#call' do
    it 'performs something' do

    end
  end
end
```

As you can see, the generated codes are minimalistic and lets you immediately
hit the ground running.


## Options

* `--test-suite`: Specify what test suite you are using. (`minitest` or `rspec`).

DEFAULT: `rspec`


## Contributing

Open an issue or pull request with any feedback, or improvements.

This project respects the [contributor code of conduct](https://github.com/sungwoncho/pattern_generator/blob/master/code_of_conduct.md).

## License

This project rocks and uses MIT-LICENSE.
