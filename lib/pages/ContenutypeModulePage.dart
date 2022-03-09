
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;

class ContenutypeModulePage extends StatefulWidget {
  const ContenutypeModulePage({Key? key}) : super(key: key);

  @override
  _ContenutypeModulePageState createState() => _ContenutypeModulePageState();
}

class _ContenutypeModulePageState extends State<ContenutypeModulePage> {

  List contenu = [];
  bool isLoadibg = false;
  var  idtypeContenuModule;
  var titreContenuModule;
  var data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration.zero, () {
      setState(() {
        data = ModalRoute.of(context)!.settings.arguments;
      });
      //print(data['id']);
      titreContenuModule = data['titre'];
      idtypeContenuModule = data['id'];
      this.fetchContenu(idtypeContenuModule);

    });
  }


  fetchContenu(idtypeContenuModule) async {
    print(idtypeContenuModule);

    String url = 'http://app.mobile.cg-mayele.com/contenu/json/type/module?id_typemodule=$idtypeContenuModule';
    print(url);
    var response = await http.get(Uri.parse(url));

    print(response.statusCode);
    if (response.statusCode == 200) {
      var items = json.decode(response.body)['Contenu']['TypeModule'];

      setState(() {
        contenu = items;
        print("type  contenu = $contenu");
      });
    } else {
      setState(() {
        contenu = [];
      });
    }
  }



  @override
  Widget build(BuildContext context) {


 return  Scaffold(
   appBar: AppBar(
     elevation: 4,
     shadowColor:const Color(0xFFA2C7F1).withOpacity(0.5),
     backgroundColor: Colors.black,
     title: Text(titreContenuModule,style: TextStyle(fontFamily: 'Raleway'),),
   ),
   backgroundColor: Colors.black,
   body: GridView.count(
     crossAxisCount: 2,
     childAspectRatio: (175/220),
     children:  List.generate(contenu.length, (index){

       return getCard(context,contenu[index]);
     }),
   ),
 );
  }






  Widget getCard(context, index) {
    var picture = index['imageName'];
    var module = index['module'];
    var titre = index['titre'];
    var video = index['video_url'];
    var description = index['description'];



    var pictureuri =
        "http://app.mobile.cg-mayele.com/uploads/file/contenu/$picture";
    var videouri =
        "http://app.mobile.cg-mayele.com/uploads/file/contenu/$video";

    return   Container(
      margin: EdgeInsets.only(top: 8.0, bottom: 8.0, left: 5, right: 5),

      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          //color: Colors.grey
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 0.5,
                offset: Offset(0,0.5)
            )
          ]
      ),
      child: GestureDetector(

        onTap: () {


          Navigator.pushNamed(context, '/video',arguments: {
            'picture': pictureuri,
            'video': videouri,
            'titre': titre,
            'module': module,
            'description': description,
          });


        },
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
          errorWidget: (context, url, error) => Icon(Icons.error),
          cacheKey: pictureuri,
        ),
      ),
    );
  }
}
