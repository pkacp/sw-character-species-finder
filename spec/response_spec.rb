# TODO expect to have multiple successes and errors inheriting from Response should i test it using shared examples?
describe Response do
  it 'should initialize with params data and message' do
    expect(Response.new({data: "fake_data"}, "message")).to be_an_instance_of Response
  end

  describe '#message' do
    before :each do
      @response = Response.new("data", "message")
    end

    it 'should be present' do
      expect(@response).to respond_to :message
    end

    it 'should return message' do
      expect(@response.message).to eql "message"
    end
  end

  describe '#data' do
    before :each do
      @response = Response.new("data", "message")
    end

    it 'should be present' do
      expect(@response).to respond_to :data
    end

    it 'should return data' do
      expect(@response.data).to eql "data"
    end
  end
end