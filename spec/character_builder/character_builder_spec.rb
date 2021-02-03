shared_examples "a character builder" do
  describe 'implement methods' do
    subject { described_class.new }
    it { is_expected.to respond_to(:build) }
    it { is_expected.to respond_to(:set_name).with(1).argument }
    it { is_expected.to respond_to(:set_age).with(1).argument }
    it { is_expected.to respond_to(:set_hair_color).with(1).argument }
  end

  before :each do
    @character_builder = described_class.new
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

    xit 'should not allow age to be negative' do
      # https://softwareengineering.stackexchange.com/a/241319
      # Builder should not provide validation for simple rules, they should be validated in created object, builder can gather all errors and return them
      # expect(@character_builder.set_age(-22)).to raise_error ArgumentError
    end
  end

  describe "#set_hair_color" do
    it 'should return builder object' do
      expect(@character_builder.set_hair_color('blonde')).to be_an_instance_of described_class
    end
  end

  describe "#build" do
    it 'should return Character with correct attributes' do
      @character_builder.set_name("name")
      @character_builder.set_age(22)
      @character_builder.set_hair_color('black')
      new_character = @character_builder.build

      expect(new_character).to be_an_instance_of Character
      expect(new_character.name).to eql "name"
      expect(new_character.age).to eql 22
      expect(new_character.hair_color).to eql "black"
    end

    it 'should return validation errors structure of incorrect attributes' do
      @character_builder.set_age(-22)
      validation_errors = @character_builder.build

      expect(validation_errors).to be_an_instance_of ValidationErrors
      expect(validation_errors).to have_at_least(1).things
    end
  end

end