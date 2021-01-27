shared_examples "a character builder" do
  describe 'implement methods' do
    subject { described_class.new }
    it { is_expected.to respond_to(:build) }
    it { is_expected.to respond_to(:set_name).with("name name").argument }
    it { is_expected.to respond_to(:set_age).with(22).argument }
    it { is_expected.to respond_to(:set_hair_color).with("dark").argument }
  end

  before do
    @character_builder = described_class.new
  end

  describe "#build" do
    it "should return Character object" do
      new_character = @character_builder.build

      expect(new_character).to be_an_instance_of Character
    end
  end

  describe "#set_name" do
    it 'should return builder object' do
      expect(@character_builder.set_name('name')).to be_an_instance_of described_class
    end
  end

  describe "#set_age" do
    it 'should return builder object' do
      expect(@character_builder.set_age(22)).to be_an_instance_of described_class
    end

    it 'should not allow age to be negative' do
      expect(@character_builder.set_age(-22)).to raise_error ArgumentError
    end
  end

  describe "#set_hair_color" do
    it 'should return builder object' do
      expect(@character_builder.set_hair_color('blonde')).to be_an_instance_of described_class
    end
  end

end