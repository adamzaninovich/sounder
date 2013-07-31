module Sounder
  module System
    def self.set_volume vol
      if vol.is_a? Numeric
        vol = vol.to_f * 7/100.0
        system %{osascript -e "set volume #{vol}"}
      end
    end
  end
end
