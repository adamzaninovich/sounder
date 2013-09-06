require 'shellwords'

module Sounder
  class Sound
    attr_reader :file
    def initialize path
      @file = Shellwords.escape path
    end

    def play
      system %{/usr/bin/afplay "#{@file}" &}
    end
  end
end
