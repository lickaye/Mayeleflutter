import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



class SliderDivertissementPage extends StatefulWidget {
  const SliderDivertissementPage({Key? key}) : super(key: key);

  @override
  _SliderDivertissementPageState createState() => _SliderDivertissementPageState();
}

class _SliderDivertissementPageState extends State<SliderDivertissementPage> {

  List  contenu =  [];
  bool isLoadibg = false;





  fetchContenu() async {
    String url = 'http://app.mobile.cg-mayele.com/contenu/json';

    var response = await http.get(Uri.parse(url));

    print(response.statusCode);
    if (response.statusCode == 200) {
      var items = json.decode(response.body)['Contenu']['Divertissements'];
      setState(() {
        contenu = items;
        isLoadibg=true;
      });

      print(contenu);
    } else {
      /*setState(() {
        contenu = [];
      });*/
    }
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.fetchContenu();
  }




  @override
  Widget build(BuildContext context) {

    Widget child;

    if (isLoadibg==false) {
      child = Container(
        height: 190.0,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) {
              return getCardNotConnection();
            }),
      );
    } else {
      child =   Container(
        height: 190.0,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: contenu.length,
            itemBuilder: (context, index) {
              return getCard(context,contenu[index]);
            }),
      );
    }

    return new Container(child: child);
  }



  Widget getCardNotConnection(){
    return Row(
      children: [
        Container(
            margin: const EdgeInsets.only(top: 0, bottom: 0, left: 8.0, right: 8.0),
            width: 130.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: const Color(0xFFA2C7F1).withOpacity(0.5),
            ),
            child: Center(child: CircularProgressIndicator())

        )
      ],
    );
  }

  Widget getCard(context, index) {
    var picture = index['imageName'];
    var module = index['module'];
    var titre = index['titre'];
    var video = index['video_url'];
    var description = index['description'];
    var idtypemodule = index['idtypemodule'];


    var pictureuri =
        "http://app.mobile.cg-mayele.com/uploads/file/contenu/$picture";
    var videouri =
        "http://app.mobile.cg-mayele.com/uploads/file/contenu/$video";

    return Container(
        margin: const EdgeInsets.only(top: 0, bottom: 0, left: 8.0, right: 8.0),
        width: 130.0,
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


            Navigator.pushNamed(context, '/youtubeplayer',arguments: {
              'picture': pictureuri,
              'video': videouri,
              'titre': titre,
              'module': module,
              'description': description,
              'idtypemodule': idtypemodule,
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
          ),
        )



    );
  }
}
