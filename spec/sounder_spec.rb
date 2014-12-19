require 'spec_helper'

describe Sounder do
  describe '#play' do
    it "plays a sound" do
      expect_any_instance_of(Sounder::Sound).to receive(:system).with %{/usr/bin/afplay "fake/file.m4a" &}
      Sounder.play 'fake/file.m4a'
    end
  end
end
