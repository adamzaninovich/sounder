require "sounder/version"
require "sounder/system"
require "sounder/sound"
require "sounder/sound_group"

module Sounder
  def self.play path
    Sound.new(path).play
  end

  class UnknownSoundError < ArgumentError; end
end
