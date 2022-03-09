import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:mayele/StringExtension.dart';

class Matiere extends StatefulWidget {
  const Matiere({Key? key}) : super(key: key);

  @override
  _MatiereState createState() => _MatiereState();
}

class _MatiereState extends State<Matiere> {
  List contenu = [];
  bool isLoadibg = false;
  var  idClasse;
  var data;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration.zero, () {
      setState(() {
        data = ModalRoute.of(context)!.settings.arguments;
        isLoadibg = true;
      });
      //print(data['cycle']);
      idClasse = data['idClasse'];
      this.fetchContenu(idClasse);

    });
  }

  fetchContenu(idClasse) async {

    String url = 'http://app.mobile.cg-mayele.com/json/matiere/par/classe/$idClasse';

    var response = await http.get(Uri.parse(url));

    //print(response.statusCode);
    if (response.statusCode == 200) {
      var items = json.decode(response.body)['Matiere'];

      setState(() {
        contenu = items;
        //print("classe contenu = $contenu");
      });
    } else {
      setState(() {
        contenu = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var data;
    data = ModalRoute.of(context)!.settings.arguments;


    Widget child;


    if (isLoadibg==false) {
      child = Container(
          child: Scaffold(
            appBar: AppBar(
              title: Text('Matières',style: TextStyle(fontFamily: 'Raleway'),),
              shadowColor:const Color(0xFFA2C7F1).withOpacity(0.5),
              backgroundColor: Colors.black,
            ),
            backgroundColor: Colors.black,
            body: getCardNotConnection(),

          )

      );
    } else {
      child =   Container(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Matières',style: TextStyle(fontFamily: 'Raleway'),),
            shadowColor:const Color(0xFFA2C7F1).withOpacity(0.5),
            backgroundColor: Colors.black,
          ),
          backgroundColor: Colors.black,
          body: bodyMatiere(context),
        ),
      );
    }





    return new Container(child: child);
  }
  Widget getCardNotConnection(){
    return Center(child: CircularProgressIndicator());
  }
  Widget bodyMatiere(context) {
    return Container(
      child: ListView.builder(
          itemCount: contenu.length,
          itemBuilder: (context, index) {
            return getCard(context, contenu[index]);
          }),
    );
  }

  Widget getCard(context, index) {
    var titre = index['nom_matiere'];
    var id = index['id'];
    var id_classe = index['id_classe'];

    var picture = index['img_url'];
    var pictureuri =
        "http://app.mobile.cg-mayele.com/uploads/file/cours/$picture";
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 5.0, 0, 5.0),
      child: Card(
        shadowColor: Colors.grey,
        color: Colors.black,
        margin: const EdgeInsets.only(bottom: 20.0),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: ListTile(
            title: Row(
              children: <Widget>[
                GestureDetector(
                    onTap: () {
//Navigator.push(context, MaterialPageRoute(builder: (context)=>videoLearnPage(index)));
                      //Navigator.of(context).pushNamed(videoLearnpage.routeName, arguments:  contenu[index]);

                      Navigator.pushNamed(context, '/cours', arguments: {
                        'id_classe': id_classe,
                        'id_matiere':id
                      });

                      // Navigator.of(context).push(MaterialPageRoute(builder: (context)=> videoLearnPage(contenuModel: contenu[index])));
                    },
                    child: Row(
                      children: [
                        Container(
                          width: 150.0,
                          height: 90.0,
                          child: CachedNetworkImage(
                            imageUrl: pictureuri.toString(),
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            placeholder: (context, url) => SizedBox(
                              child: Center(child: CircularProgressIndicator()),
                              height: 50.0,
                              width: 50.0,
                            ),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(titre.toString().capitalize(),
                                style: TextStyle(
                                    fontSize: 18, fontFamily: 'Raleway',color: Colors.white)),
                          ],
                        )
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
