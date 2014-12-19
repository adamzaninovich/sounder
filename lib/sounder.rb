require "sounder/version"
require "sounder/system"
require "sounder/sound"
require "sounder/sound_group"
require "sounder/soundboard"

module Sounder
  def self.play path
    Sound.new(path).play
  end

  class UnknownSoundError < ArgumentError; end
  class RootNotSetError < ArgumentError; end
end
