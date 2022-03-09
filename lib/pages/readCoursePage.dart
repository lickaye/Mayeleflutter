
import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mayele/StringExtension.dart';

class readcoursePage extends StatefulWidget {
  const readcoursePage({Key? key}) : super(key: key);

  @override
  _readcoursePageState createState() => _readcoursePageState();
}

class _readcoursePageState extends State<readcoursePage> {

  List contenu = [];
  bool isLoadibg = false;
  var  pdf;
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
      pdf = data['id_classe'];
      idMatiere = data['id_matiere'];



    });
  }





  @override
  Widget build(BuildContext context) {
    var  pdf;
    var  titre;

    var affiche_du_cours= "Affiche du Cours";

    var text_video_cours= "Vidéos du cours ";
    data = ModalRoute.of(context)!.settings.arguments;

    pdf = data['pdf'];
    titre = data['titre'];


    return Scaffold(
      appBar: AppBar(
        title: Text('Cours',style: TextStyle(fontFamily: 'Raleway')),
        shadowColor:const Color(0xFFA2C7F1).withOpacity(0.5),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Container(
        margin: const EdgeInsets.fromLTRB(0, 5.0, 0, 5.0),
        child: Column(
          children: [
            Card(
              color: Colors.black,
              shadowColor: Colors.grey,
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

                            Navigator.pushNamed(context, '/readpdfcours', arguments: {
                              'pdf': pdf,
                              'titre':titre
                            });

                            // Navigator.of(context).push(MaterialPageRoute(builder: (context)=> videoLearnPage(contenuModel: contenu[index])));
                          },
                          child: Row(
                            children: [
                              Container(
                                width: 120.0,
                                height: 90.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  image: DecorationImage(
                                    image: AssetImage('images/pdf_illustration.jpg'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(affiche_du_cours.toString().capitalize(),
                                      style: TextStyle(
                                          fontSize: 18, fontFamily: 'Raleway',color: Colors.white)),
                                ],
                              )
                            ],
                          )),


                    ],
                  ),
                ),
              ),
            ),

            Card(
              margin: const EdgeInsets.fromLTRB(0, 5.0, 0, 5.0),
              shadowColor: Colors.grey,
              color: Colors.black,
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
                              'pdf': pdf,
                            });

                            // Navigator.of(context).push(MaterialPageRoute(builder: (context)=> videoLearnPage(contenuModel: contenu[index])));
                          },
                          child: Row(
                            children: [
                              Container(
                                width: 120.0,
                                height: 90.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  image: DecorationImage(
                                    image: AssetImage('images/video_illustration.jpg'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(text_video_cours.toString().capitalize(),
                                      style: TextStyle(
                                          fontSize: 18, fontFamily: 'Raleway',color: Colors.white)),
                                ],
                              )
                            ],
                          )),


                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }






}
