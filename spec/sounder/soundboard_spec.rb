require 'pry'
require 'spec_helper'

describe Sounder::Soundboard do
  let(:sounds) { { 'sound name' => 'path' } }
  subject(:soundboard) { Sounder::Soundboard.new sounds: sounds, root: root }

  describe '#run' do
    context "when root isn't set" do
      let(:root) {}
      it "raises an error if the root isn't set" do
        expect { soundboard.run(['test']) }.to raise_error Sounder::RootNotSetError
      end
    end

    context "when root is set" do
      let(:root) { 'some/path' }
      it "plays a random sound when given random" do
        expect_any_instance_of(Sounder::SoundGroup).to receive :random
        soundboard.run %w[random]
      end
      it "displays the usage if --help option is given" do
        expect(soundboard).to receive(:usage).and_return []
        soundboard.run %w[--help]
      end
      it "displays the usage if -h option is given" do
        expect(soundboard).to receive(:usage).and_return []
        soundboard.run %w[-h]
      end
      it "displays the usage if no option is given" do
        expect(soundboard).to receive(:usage).and_return []
        soundboard.run []
      end
      it "plays a sound if a valid sound name is given" do
        expect_any_instance_of(Sounder::SoundGroup).to receive :play
        soundboard.run %w[sound name]
      end
      it "displays usage if an invalid sound name is given" do
        allow_any_instance_of(Sounder::SoundGroup).to receive(:play).and_raise Sounder::UnknownSoundError
        expect(soundboard).to receive :unknown_sound_message
        soundboard.run %w[invalid name]
      end
    end
  end
end
