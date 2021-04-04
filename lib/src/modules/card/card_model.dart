class ModelOfCard {
  String name;
  String type;
  String rarity;
  String text;
  String artist;
  String imageUrl;
  String id;
  List<ModelOfForeignNames> foreignNames;

  ModelOfCard(
      {this.name = '',
      this.id = '',
      this.type = '',
      this.rarity = '',
      this.text = '',
      this.artist = '',
      this.imageUrl = '',
      this.foreignNames});

  ModelOfCard.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    type = json['type'];
    rarity = json['rarity'];
    text = json['text'];
    artist = json['artist'];
    imageUrl = json['imageUrl'];
    if (json['foreignNames'] != null) {
      foreignNames = [].cast<ModelOfForeignNames>();
      json['foreignNames'].forEach((v) {
        final _foreignName = ModelOfForeignNames.fromJson(v);
        foreignNames.add(_foreignName);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['type'] = this.type;
    data['rarity'] = this.rarity;
    data['text'] = this.text;
    data['artist'] = this.artist;
    data['imageUrl'] = this.imageUrl;
    if (this.foreignNames != null) {
      data['foreignNames'] = this.foreignNames.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ModelOfForeignNames {
  String name;
  String text;
  String type;
  String flavor;
  String imageUrl;
  String language;
  int multiverseid;

  ModelOfForeignNames(
      {this.name,
      this.text,
      this.type,
      this.flavor,
      this.imageUrl,
      this.language,
      this.multiverseid});

  ModelOfForeignNames.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    text = json['text'];
    type = json['type'];
    flavor = json['flavor'];
    imageUrl = json['imageUrl'];
    language = json['language'];
    multiverseid = json['multiverseid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['text'] = this.text;
    data['type'] = this.type;
    data['flavor'] = this.flavor;
    data['imageUrl'] = this.imageUrl;
    data['language'] = this.language;
    data['multiverseid'] = this.multiverseid;
    return data;
  }
}
