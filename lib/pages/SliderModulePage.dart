import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SliderModulePage extends StatefulWidget {
  const SliderModulePage({Key? key}) : super(key: key);

  @override
  _SliderModulePageState createState() => _SliderModulePageState();
}

class _SliderModulePageState extends State<SliderModulePage> {
  List contenu = [];
  bool isLoadibg = false;

  fetchContenu() async {
    String url = 'http://app.mobile.cg-mayele.com/json/type/module';

    var response = await http.get(Uri.parse(url));

    print(response.statusCode);
    if (response.statusCode == 200) {
      var items = json.decode(response.body)['TYPEMODULE'];
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
        height: 190,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 8,
            itemBuilder: (context, index) {
              return getCardNotConnetion();
            }),
      );
    } else {
      child = Container(
        height: 190,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: contenu.length,
            itemBuilder: (context, index) {
              return getCard(context, contenu[index]);
            }),
      );
    }
    return new Container(child: child);
  }

  Widget getCardNotConnetion(){
    return Container(
      margin: const EdgeInsets.only(right: 10.0),
      width: 90.0,
      height: 90.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
          color: const Color(0xFFA2C7F1).withOpacity(0.5),
        border: Border.all(
          color: Colors.white,
          width: 2.0,
        ),),
        child: Center(child: CircularProgressIndicator())
    );
  }

  Widget getCard(context, index) {
    var picture = index['image_url'];
    var titre = index['nom'];
    var id = index['id'];

    var pictureuri =
        "http://app.mobile.cg-mayele.com/uploads/file/cours/$picture";

    return Container(
      margin: const EdgeInsets.only(right: 10.0),
      width: 90.0,
      height: 90.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
          color: const Color(0xFFA2C7F1).withOpacity(0.5)),

        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/contenutypemodule',arguments: {
              'id': id,
              'titre': titre,
            });

          },
          child: CachedNetworkImage(
            imageUrl: pictureuri.toString(),
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                color: const Color(0xffbac0c7),
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
                border: Border.all(
                  color: Colors.white,
                  width: 2.0,
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
