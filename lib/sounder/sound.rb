module Sounder
  class Sound
    attr_reader :file
    def initialize path
      @file = path
    end

    def play
      system %{/usr/bin/afplay "#{@file}" &}
    end
  end
end
