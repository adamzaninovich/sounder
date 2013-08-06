module Sounder
  class SoundGroup
    attr_reader :sounds

    def initialize sounds_hsh
      @sounds = {}
      sounds_hsh.each do |name, file|
        @sounds[name.to_s] = Sounder::Sound.new file
      end
    end

    def play name
      sound = sounds.fetch(fuzzy_find name) { raise UnknownSoundError }
      sound.play
    end

    def random
      @sounds.map do |_,sound|
        sound
      end.sample.play
    end

    def usage
      usage = [ "random (picks a random sound)",
        "<sound name> (it will fuzzy match the name)",
        "Available sounds:"
      ] + @sounds.keys.map do |sound|
        "  #{sound}"
      end
      usage.join "\n"
    end


    private
    def fuzzy_find name
      @sounds.keys.select { |sn| sn.include? name }.first
    end

  end
end
