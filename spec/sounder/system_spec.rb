require 'spec_helper'

describe Sounder do

  describe Sounder::System do
    describe '.set_volume' do
      it "uses system to set the volume" do
        Sounder::System.should_receive(:system).with %{osascript -e "set volume 7.0"}
        Sounder::System.set_volume 100
      end
      it "converts the number to base 7" do
        Sounder::System.should_receive(:system).with %{osascript -e "set volume 3.5"}
        Sounder::System.set_volume 50
      end
      it "doesn't make the call if it isn't given a number" do
        Sounder::System.should_not_receive(:system)
        Sounder::System.set_volume "something bad"
      end
    end
  end

end
