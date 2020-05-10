describe Miniverse::Thing::Zipfile do
  describe "#get_zipped_file" do
    let(:cube) { described_class.new(fixture_path("XYZ_20mm_Calibration_Cube.zip")) }
    it { expect(cube.send(:get_zipped_file, "ABSENT")).to eq nil }
    it { expect(cube.send(:get_zipped_file, "attribution_card.html")).to be_a String }
    it { expect(cube.send(:get_zipped_file, "attribution_card.html").length).to eq(2246) }
  end
end
