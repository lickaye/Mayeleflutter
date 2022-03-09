import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class bibiothequeVideoPage extends StatefulWidget {
  const bibiothequeVideoPage({Key? key}) : super(key: key);

  @override
  _bibiothequeVideoPageState createState() => _bibiothequeVideoPageState();
}

class _bibiothequeVideoPageState extends State<bibiothequeVideoPage> {

  List  contenu =  [];
  bool isLoadibg = false;





  fetchContenu() async {
    String url = 'http://app.mobile.cg-mayele.com/jsonbibiotheque/numerique';

    var response = await http.get(Uri.parse(url));

    print(response.statusCode);
    if (response.statusCode == 200) {
      var items = json.decode(response.body)['Bibiotheque']['Video'];
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
        child: Scaffold(
          appBar: AppBar(
            elevation: 4,
            shadowColor:const Color(0xFFA2C7F1).withOpacity(0.5),
            backgroundColor: Colors.black,
            title: Text("Biobiothèque vidéos",style: TextStyle(fontFamily: 'Raleway'),),
          ),
          backgroundColor: Colors.black,
          body: getCardNotConnection(),
        ),

      );
    } else {
      child =   Container(
        child: Scaffold(
          appBar: AppBar(
            elevation: 4,
            shadowColor:const Color(0xFFA2C7F1).withOpacity(0.5),
            backgroundColor: Colors.black,
            title: Text("Biobiothèque vidéos",style: TextStyle(fontFamily: 'Raleway'),),
          ),
          backgroundColor: Colors.black,
          body: GridView.count(
            crossAxisCount: 2,
            childAspectRatio: (175/220),
            children:  List.generate(contenu.length, (index){

              return getCard(context,contenu[index]);
            }),
          ),
        ),
      );
    }

    return new Container(child: child);



  }
Widget getCardNotConnection(){
    return Center(child: CircularProgressIndicator());
}
  Widget getCard(context,index){

    var picture = index['imageName'];
    var module = index['module'];
    var titre = index['titre'];
    var video = index['video'];
    var description = index['description'];

    var pictureuri =
        "http://app.mobile.cg-mayele.com/uploads/file/cours/$picture";
    var videouri =
        "http://app.mobile.cg-mayele.com/uploads/file/cours/$video";

     return    Container(
      margin: EdgeInsets.only(top: 8.0, bottom: 8.0, left: 5, right: 5),

      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          //color: Colors.grey
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(0,1)
            )
          ]
      ),
      child: GestureDetector(

        onTap: () {


          Navigator.pushNamed(context, '/youtubevideo',arguments: {
            'picture': pictureuri,
            'video': video,
            'titre': 'kkkk',
            'module': "hjio",
            'description': "hhhhhh",
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
