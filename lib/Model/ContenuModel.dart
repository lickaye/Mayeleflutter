
class ContenuModel {
  final String id;
  final String titre;
  final String description;
  final String typemodule;
  final String imageName;
  final String video_url;

  ContenuModel(this.id, this.titre,this.description,this.typemodule,this.imageName,this.video_url);

  ContenuModel.fromJson(Map<String, dynamic> json)
      : id = json['name'],
        titre = json['titre'],
        description = json['description'],
        typemodule = json['typemodule'],
        imageName = json['imageName'],
        video_url = json['video_url'];


  Map<String, dynamic> toJson() => {
    'id': id,
    'titre': titre,
    'description': description,
    'typemodule': typemodule,
    'imageName': imageName,
    'video_url': video_url,
  };
}


