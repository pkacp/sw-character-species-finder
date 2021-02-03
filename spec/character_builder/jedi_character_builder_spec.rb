RSpec.describe JediCharacterBuilder do

  it_behaves_like "a character builder"

  before do
    @jedi_builder = described_class.new
  end

  describe "#add_padawan" do
    it 'should return builder object' do
      character = Character.new
      expect(@jedi_builder.add_padawan(character)).to be_an_instance_of described_class
    end
  end

end