class SliderShow {
  final int id;
  final String titre;
  final String descriprion;
  final String img_url;
  final String video_url;


  SliderShow(
      { required this.id,required this.titre,required this.descriprion,required this.img_url,required this.video_url});

  factory SliderShow.fromJson(dynamic json) {

    /*if (json == null) {
      return SliderShow(titre: '', img_url: "", descriprion: '', video_url: '', id: 0);
    }*/

    return SliderShow(
        titre: json['backdrop_path'],
        id: json['id'],
        descriprion: json['original_language'],
        img_url: json['original_title'],
        video_url: json['overview'],
       );
  }
}