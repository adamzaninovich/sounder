# Sounder

Play sounds on your Mac

## Installation

Add this line to your application's Gemfile:

    gem 'sounder'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sounder

## Usage

    Sounder::System.set_volume 70 # 0-100

    Sounder.play File.expand_path('../support/mysound.m4a', __FILE__)

    sound = Sounder::Sound.new "/path/to/audio/file"
    sound.play

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
