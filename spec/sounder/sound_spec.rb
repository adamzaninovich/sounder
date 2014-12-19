require 'spec_helper'

describe Sounder::Sound do
  let(:sound) { Sounder::Sound.new 'fake/file.m4a' }
  describe 'initialization' do
    it "saves the file as a path" do
      expect(sound.file).to eq 'fake/file.m4a'
    end
  end

  describe '#play' do
    it "plays a file" do
      expect(sound).to receive(:system).with %{/usr/bin/afplay "fake/file.m4a" &}
      sound.play
    end
    it "is not super insecure" do
      bad_sound = Sounder::Sound.new '";echo doing bad things;"'
      expect(bad_sound).to receive(:system).with %{/usr/bin/afplay \"\\\"\\;echo\\ doing\\ bad\\ things\\;\\\"\" &}
      bad_sound.play
    end
  end
end
