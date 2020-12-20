describe StarWarsApi do
  describe ".get_from_plain_url" do
    it 'should be present' do
      expect(StarWarsApi).to respond_to :get_from_plain_url
    end

    it 'should return object when object present at url' do
    end

    it 'should return NotFound error when object not present at url' do
      stub_request(:get, "https://swapi.dev/api/people/999999")
          .to_return(body: {detail: "Not found"}.to_json, status: :not_found)
      expect(StarWarsApi.get_from_plain_url("https://swapi.dev/api/people/999999")).to be_an_instance_of NotFound
    end
  end

  # context "species resource" do
  #   it 'should initialize with species param' do
  #     expect(StarWarsApi.new('species')).to be_an_instance_of StarWarsApi
  #   end
  #
  #   describe "" do
  #     before :each do
  #       @connector = StarWarsApi.new('species')
  #     end
  #   end
  # end

  context "people resource" do
    it 'should initialize with people param' do
      expect(StarWarsApi.new('people')).to be_an_instance_of StarWarsApi
    end

    describe "#find_by_name" do
      before :each do
        @connector = StarWarsApi.new('people')

        let(:res_0) { {
            count: 0,
            next: null,
            previous: null,
            results: []
        } }
        let(:res_1) { {
            count: 1,
            next: null,
            previous: null,
            results: [{name: "Luke Skywalker"}]
        } }
        let(:res_2) { {
            count: 2,
            next: null,
            previous: null,
            results: [{name: "Luke Skywalker"}, {name: "Leia Skywalker"}]
        } }
      end

      it 'should be present' do
        expect(@connector).to respond_to :find_by_name
      end

      it 'should take value' do
        expect(@connector.find_by_name('fake name')).not_to raise_error ArgumentError
      end

      it "should return NotFound error when not found any matching objects" do
        stub_request(:get, "https://swapi.dev/api/people/?search=FAKE SW NAME")
            .to_return(body: res_0.to_json)
        expect(@connector.find_by_name('FAKE SW NAME')).to be_an_instance_of NotFound
      end

      it 'should return TooMany error when found more than 1 matching object' do
        stub_request(:get, "https://swapi.dev/api/people/?search=L")
            .to_return(body: res_2.to_json)
        expect(@connector.find_by_name('L')).to be_an_instance_of TooMany
      end

      it 'should return NotMatching when result name is not exactly matching given string' do
        stub_request(:get, "https://swapi.dev/api/people/?search=Luk")
            .to_return(body: res_1.to_json)
        expect(@connector.find_by_name('Luk')).to be_an_instance_of NotMatching
      end

      it 'should return object when found 1 matching' do
        stub_request(:get, "https://swapi.dev/api/people/?search=Luke Skywalker")
            .to_return(body: res_1.to_json)
        expect(@connector.find_by_name('Luke Skywalker')).to be_an_instance_of Hash #Character
      end

      it 'should return object when found 1 matching case insensitive' do
        stub_request(:get, "https://swapi.dev/api/people/?search=luke skywalker")
            .to_return(body: res_1.to_json)
        expect(@connector.find_by_name('luke skywalker')).to be_an_instance_of Hash #Character
      end
    end
  end
end