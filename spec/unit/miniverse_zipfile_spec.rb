describe Miniverse::Zipfile do
  describe "#get_file" do
    let(:cube) { described_class.new(fixture_path("XYZ_20mm_Calibration_Cube.zip")) }
    it { expect(cube.get_file("ABSENT")).to eq nil }
    it { expect(cube.get_file("attribution_card.html")).to be_a String }
    it { expect(cube.get_file("attribution_card.html").length).to eq(2246) }
  end
end
