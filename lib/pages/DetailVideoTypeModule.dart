import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class detailvideoTypeModule extends StatefulWidget {
  const detailvideoTypeModule({Key? key}) : super(key: key);

  @override
  _detailvideoTypeModuleState createState() => _detailvideoTypeModuleState();
}

class _detailvideoTypeModuleState extends State<detailvideoTypeModule> {

  List contenu = [];
  bool isLoadibg = false;
  var  idtypemodule;
  var data;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration.zero, () {
      setState(() {
        data = ModalRoute.of(context)!.settings.arguments;
      });

      idtypemodule = data['idtypemodule'];
      this.fetchContenu(idtypemodule);

    });
  }




  fetchContenu(idtypemodule) async {

    String url = 'http://app.mobile.cg-mayele.com/contenu/json/type/module?id_typemodule=$idtypemodule';

    var response = await http.get(Uri.parse(url));

    //print(response.statusCode);
    if (response.statusCode == 200) {
      var items = json.decode(response.body)['Contenu']['TypeModule'];
      setState(() {
        contenu = items;
        print(contenu);

      });
    } else {
      setState(() {
        contenu = [];
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return  GridView.count(
      crossAxisCount: 2,
      childAspectRatio: (175/220),
      children:  List.generate(contenu.length, (index){

        return getCard(context,contenu[index]);
      }),
    );
  }



  Widget getCard(context, index) {
    var picture = index['imageName'];
    var module = index['module'];
    var titre = index['titre'];
    var video = index['video_url'];
    var description = index['description'];
    var idtypemodule = index['id_typemodule'];

    print(idtypemodule);


    var pictureuri =
        "http://app.mobile.cg-mayele.com/uploads/file/contenu/$picture";
    var videouri =
        "http://app.mobile.cg-mayele.com/uploads/file/contenu/$video";

    return    Container(
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
          cacheKey: pictureuri,
        ),
      ),
    );
  }
}
