describe CharacterMapper do
  context '.parse_params' do

    let(:res){
      {
          "birth_year": "19 BBY",
          "eye_color": "Blue",
          "films": [
              "https://swapi.dev/api/films/1/",
          ],
          "gender": "Male",
          "hair_color": "Blond",
          "height": "172",
          "homeworld": "https://swapi.dev/api/planets/1/",
          "mass": "77",
          "name": "Luke Skywalker",
          "skin_color": "Fair",
          "created": "2014-12-09T13:50:51.644000Z",
          "edited": "2014-12-10T13:52:43.172000Z",
          "species": [
              "https://swapi.dev/api/species/1/"
          ],
          "starships": [
              "https://swapi.dev/api/starships/12/"
          ],
          "url": "https://swapi.dev/api/people/1/",
          "vehicles": [
              "https://swapi.dev/api/vehicles/14/"
          ]
      }
    }

    it 'should return valid params for character' do
      mapped_params = CharacterMapper.map(res)
      expect(Character.new(mapped_params)).not_to be_an_instance_of ValidationError
    end

  end

end