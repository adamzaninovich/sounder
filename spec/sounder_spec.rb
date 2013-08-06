require 'spec_helper'

describe Sounder do
  describe '#play' do
    it "plays a sound" do
      Sounder::Sound.any_instance.should_receive(:system).with %{/usr/bin/afplay "fake/file.m4a" &}
      Sounder.play 'fake/file.m4a'
    end
  end
end
