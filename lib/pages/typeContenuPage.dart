import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mayele/StringExtension.dart';

class typeContenuPage extends StatefulWidget {
  const typeContenuPage({Key? key}) : super(key: key);

  @override
  _typeContenuPageState createState() => _typeContenuPageState();
}

class _typeContenuPageState extends State<typeContenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Biobiothèques numériques',style: TextStyle(fontFamily: 'Raleway'),),
        elevation: 4,
        shadowColor:const Color(0xFFA2C7F1).withOpacity(0.5),
        backgroundColor: Colors.black,
      ),

     backgroundColor: Colors.black,
      body: bodyBibiotheque(context),
    );
  }


  Widget bodyBibiotheque(context){


    var text_videos="Videos";
    var text_pdf="Pdf";

    var pictureuri = "";

    return Container(
      margin: EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 0),
      child: Column(
        children: [
          Card(
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

                          Navigator.pushNamed(context, '/bibiothequevideo', arguments: {
                            'type_contenu': 'videos',
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
                                  image: AssetImage('images/video2_illustration.jpg'),
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
                                Text(text_videos.toString().capitalize(),
                                    style: TextStyle(
                                        fontSize: 18,fontFamily: 'Raleway' ,color: Colors.white)),
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
                            'type_contenu': 'pdf',
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
                                  image: AssetImage('images/pdf2_illustration.png'),
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
                                Text(text_pdf.toString().capitalize(),
                                    style: TextStyle(
                                        fontSize: 18, fontFamily: 'Raleway' ,color: Colors.white)),
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
    );
  }
}
