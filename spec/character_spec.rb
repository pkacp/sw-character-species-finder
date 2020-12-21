describe Character do
  describe '#initialize' do
    it 'should have name and species as params' do
      expect(Character.new({name: "", species: []})).to be_an_instance_of Character # species urls?
    end

    it 'should return ValidationError when given invalid params' do
      expect(Character.new({})).to be_an_instance_of ValidationError
    end

    it 'should ValidationError if species is not an array' do
      expect(Character.new({name: "", species: []})).to be_an_instance_of ValidationError
    end
  end

  describe "#human?" do
    it 'should return true if character is human' do
      # todo stub swconnector
    end

    it 'should return false if character is not human'

  end
end