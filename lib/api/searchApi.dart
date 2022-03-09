import 'dart:convert';
import 'package:http/http.dart' as http;


class Search{

   final String titre;
   final String description;
   final String typemodule;
   final String imageName;
   final String video_url;
   final String module;

  const Search({
    required this.titre,required this.description,required this.typemodule,required this.imageName,required this.video_url,required this.module
  });

  static Search fromJson(Map<String, dynamic> json) => Search(

    titre: json['titre'],
    description: json['description'],
    typemodule: json['typemodule'],
    imageName: json['imageName'],
    video_url: json['video_url'],
    module: json['module'],

  );
}




class SearchApi {
  static Future<List<Search>> getUserSuggestions(String query) async {
    final url = Uri.parse('http://app.mobile.cg-mayele.com/search/contenu');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List searchs = json.decode(response.body)['Contenu'];

      return searchs.map((json) => Search.fromJson(json)).where((search) {
        final nameLower = search.titre.toLowerCase();
        final queryLower = query.toLowerCase();

        return nameLower.contains(queryLower);
      }).toList();
    } else {
      throw Exception();
    }
  }
}