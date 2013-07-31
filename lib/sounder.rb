require "sounder/version"
require "sounder/system"
require "sounder/sound"

module Sounder
  def self.play path
    Sound.new(path).play
  end
end
