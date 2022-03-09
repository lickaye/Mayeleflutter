import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mayele/StringExtension.dart';



class CoursPages extends StatefulWidget {
  const CoursPages({Key? key}) : super(key: key);

  @override
  _CoursPagesState createState() => _CoursPagesState();
}

class _CoursPagesState extends State<CoursPages> {

  List contenu = [];
  bool isLoadibg = false;
  var  idClasse;
  var  idMatiere;

  var data;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration.zero, () {
      setState(() {
        data = ModalRoute.of(context)!.settings.arguments;
      });
      print(data);
      idClasse = data['id_classe'];
      idMatiere = data['id_matiere'];

      this.fetchContenu(idMatiere,idClasse,);

    });
  }

  fetchContenu(idMatiere,idClasse) async {

    print(idMatiere);
    String url = 'http://app.mobile.cg-mayele.com/json/cours?idMatiere=$idMatiere&idClasse=$idClasse';
    var response = await http.get(Uri.parse(url));

    //print(response.statusCode);
    if (response.statusCode == 200) {
      var items = json.decode(response.body)['COURS'];

      setState(() {
        contenu = items;
        print("cours contenu = $contenu");
      });
    } else {
      setState(() {
        contenu = [];
      });
    }
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Cours',style: TextStyle(fontFamily: 'Raleway')),
        shadowColor:const Color(0xFFA2C7F1).withOpacity(0.5),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: bodyCours(context),
    );
  }
  Widget bodyCours(context) {
    return Container(
      child: ListView.builder(
          itemCount: contenu.length,
          itemBuilder: (context, index) {
            return getCard(context, contenu[index]);
          }),
    );
  }



  Widget getCard(context, index) {
    var pdf = index['pdf'];
    var affiche_du_cours= "Affiche du Cours";
    var id = index['id'];
    var id_classe = index['id_classe'];
    var titre = index['titre'];

    var text_video_cours= "Vidéos du cours ";

    var picture = index['img'];
    var pictureuri =
        "http://app.mobile.cg-mayele.com/uploads/file/cours/$picture";
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 5.0, 0, 5.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {

              Navigator.pushNamed(context, '/readcourse', arguments: {
                'pdf': pdf,
                'titre':titre
              });
            },
            child: Row(

              children: [
                Container(
                  width: 120.0,
                  height: 90.0,
                  child: CachedNetworkImage(
                    imageUrl: pictureuri.toString(),
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        color: const Color(0xffbac0c7),
                        borderRadius: BorderRadius.all(Radius.circular(2.0)),
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                        border: Border.all(
                          color: Colors.white,
                          width: 2.0,
                        ),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 1,
                                offset: Offset(0,1)
                            )
                          ]
                      ),
                    ),
                    placeholder: (context, url) => SizedBox(
                      child: Center(child: CircularProgressIndicator()),
                      height: 50.0,
                      width: 50.0,
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                    cacheKey: pictureuri,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child:Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(titre.toString().capitalize(),
                          style: TextStyle(
                              fontSize: 18, fontFamily: 'Raleway',color: Colors.white)),
                    ],

                  ) ,

                )

              ],

            ),


          ),
          Divider(
            color: Colors.grey,
          )
        ],
      ),

    );
  }



}
