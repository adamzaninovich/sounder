module Sounder
  class Soundboard
    attr_reader :version_info
    attr_accessor :root

    def initialize sounds:, version_info: "Sounder Soundboard", root: nil
      @soundgroup = {}
      @version_info = version_info
      @sounds = sounds
      @root = root
    end

    def run args
      case
      when random?(args) then soundgroup.random
      when help?(args)   then puts usage
      when sound?(args)  then play_sound(args.join ' ')
      else
        puts usage
      end
    end

    private

    def soundgroup
      @soundgroup[root] ||= begin
        names_and_paths = Hash[@sounds.map { |name, file| [name, get_path(file)] }]
        SoundGroup.new names_and_paths
      end
    end

    def play_sound sound_name
      soundgroup.play sound_name
    rescue UnknownSoundError
      unknown_sound_message sound_name
    end

    def unknown_sound_message sound_name
      puts "Error: \"#{sound_name}\" does not match a known sound"
      puts usage
    end

    def get_path file
      raise RootNotSetError.new("You must set a support directory first") unless root
      File.join root, "#{file}.m4a"
    end

    def sound? args
      not args.empty?
    end

    def help? args
      args.size == 1 && %w[-h --help].include?(args.first)
    end

    def random? args
      args.size == 1 && args.first == 'random'
    end

    def usage
      usage = soundgroup.usage.map { |line| "  #{line}" }
      usage.unshift version_info, "Usage:"
      usage.join "\n"
    end

  end
end
