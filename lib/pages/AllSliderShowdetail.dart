import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class AllSliderShowDetail extends StatefulWidget {
  const AllSliderShowDetail({Key? key}) : super(key: key);

  @override
  _AllSliderShowDetailState createState() => _AllSliderShowDetailState();
}

class _AllSliderShowDetailState extends State<AllSliderShowDetail> {
  List contenu = [];
  bool isLoadibg = false;
  var  idtypemodule;
  var data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    this.fetchContenu();
  }
  fetchContenu() async {

    String url = 'http://app.mobile.cg-mayele.com/json/slider/show';

    var response = await http.get(Uri.parse(url));

    //print(response.statusCode);
    if (response.statusCode == 200) {
      var items = json.decode(response.body)['Slider'];
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
    var picture = index['img_url'];
    var titre = index['titre'];
    var videouri = index['video_url'];
    var description = index['description'];





    var pictureuri =
        "http://app.mobile.cg-mayele.com/uploads/file/contenu/$picture";


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

          Navigator.pushNamed(context, '/carouseldetail',arguments: {
            'picture': pictureuri,
            'video': videouri,
            'titre': titre,
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
