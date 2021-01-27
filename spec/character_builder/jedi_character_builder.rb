RSpec.describe JediCharacterBuilder do

  it_behaves_like "a character builder"

  before do
    @jedi_builder = described_class.new
  end

  describe "#add_padawan" do
    it 'should return builder object' do
      character = double("Character")
      expect(@jedi_builder.add_padawan(character)).to be_an_instance_of described_class
    end

    it 'should validate type of padawan' do
      expect(@jedi_builder.add_padawan(1)).to raise_error ArgumentError
      expect(@jedi_builder.add_padawan("2")).to raise_error ArgumentError
      expect(@jedi_builder.add_padawan(nil)).to raise_error ArgumentError
      character = class_double("Character")
      expect(@jedi_builder.add_padawan(character)).not_to raise_error
    end

  end

end