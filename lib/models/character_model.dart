class CharacterModel {
  final int _id;
  final String _name;
  final String _status;
  final String _species;
  final String _image;

  int get id => _id;

  String get name => _name;

  String get status => _status;

  String get species => _species;

  String get image => _image;

  CharacterModel.fromJson(Map<String, dynamic>json)
      :
        this._id = json["id"],
        this._name = json["name"],
        this._status = json["status"],
        this._species = json["species"],
        this._image = json["image"];
}
class CharacterList{
  final List<CharacterModel> characters = [];
  CharacterList.fromJson(List<dynamic> jsonItems) {
    for (var jsonItem in jsonItems) {
      characters.add(CharacterModel.fromJson(jsonItem));
    }
  }
}

abstract class CharacterResult{}

class CharacterResultSuccess extends CharacterResult {
  final CharacterList characterList;
  CharacterResultSuccess(this.characterList);
}

class CharacterResultError extends CharacterResult{
  final String error;
  CharacterResultError(this.error);
}

class CharacterResultLoading extends CharacterResult{
  CharacterResultLoading();
}