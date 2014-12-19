require 'spec_helper'

describe Sounder do

  describe Sounder::SoundGroup do
    let!(:sounds) do
      {
        sound_a: 'sounda.m4a',
        'sound_b' => 'soundb.m4a'
      }
    end

    describe 'initialization' do
      it "accepts a hash with strings or symbols as keys" do
        Sounder::SoundGroup.new sounds
      end
      it "creates sound objects" do
        sounds.each do |name, file|
          expect(Sounder::Sound).to receive(:new).with file
        end
        Sounder::SoundGroup.new sounds
      end
    end

    describe '#play' do
      it "plays a sound corresponding to the argument passed in" do
        group = Sounder::SoundGroup.new sounds
        sound_b = group.sounds.fetch "sound_b"
        expect(sound_b).to receive(:play)
        group.play "sound_b"
      end

      it "fuzzy matches the sound name" do
        group = Sounder::SoundGroup.new sounds
        sound_b = group.sounds.fetch "sound_b"
        expect(sound_b).to receive(:play)
        group.play "b"
      end

      it "raises UnknownSoundError when no sound is found" do
        group = Sounder::SoundGroup.new sounds
        expect { group.play "x" }.to raise_error Sounder::UnknownSoundError
      end
    end

    describe '#random' do
      it "plays a random sound" do
        group = Sounder::SoundGroup.new sounds
        expect_any_instance_of(Sounder::Sound).to receive :play
        group.random
      end
    end

    describe '#usage' do
      it "returns usage info in a string" do
        group = Sounder::SoundGroup.new sounds
        expect(group.usage).to include "random (picks a random sound)"
        expect(group.usage).to include "  sound_a"
        expect(group.usage).to include "  sound_b"
      end
    end
  end

end
