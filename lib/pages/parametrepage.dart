import 'package:flutter/material.dart';

class parametrePage extends StatefulWidget {
  const parametrePage({Key? key}) : super(key: key);

  @override
  _parametrePageState createState() => _parametrePageState();
}

class _parametrePageState extends State<parametrePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                            top: 0, bottom: 0, left: 8.0, right: 8.0),
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                            color: const Color(0xFFA2C7F1).withOpacity(0.5),
                            borderRadius: BorderRadius.circular(80 / 2),
                            border: Border.all(
                              color: const Color(0xFFA2C7F1).withOpacity(0.5),
                              width: 2.0,
                            ),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    "https://pics.filmaffinity.com/Chilling_Adventures_of_Sabrina_TV_Series-595796535-large.jpg"))),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                            top: 0, bottom: 0, left:15.0, right: 0.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Mayele',
                              style: TextStyle(fontSize: 16,color: Colors.white,),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              "contact@mayele.com",
                              style: TextStyle(color: Colors.grey,fontFamily: 'Raleway'),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Divider(color: const Color(0xFFA2C7F1).withOpacity(0.5),),
            Container(

              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.lock,
                        color: Colors.blue,
                        size: 25.0,
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                            top: 0, bottom: 0, left:15.0, right: 0.0),
                        child: Column(

                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[

                            Text(
                              'Mon Compte',
                              style: TextStyle(fontSize: 16,color: Colors.white,fontFamily: 'Raleway'),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "Modifier mes informations",
                              style: TextStyle(color: Colors.grey,fontFamily: 'Raleway'),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.phone,
                        color: Colors.blue,
                        size: 25.0,
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                            top: 0, bottom: 0, left:15.0, right: 0.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Contactez-nous',
                              style: TextStyle(fontSize: 16,color: Colors.white,fontFamily: 'Raleway'),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "Des question? Besoin d'aide?",
                              style: TextStyle(color: Colors.grey,fontFamily: 'Raleway'),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),

            SizedBox(
              height: 25,
            ),
            Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.person,
                        color: Colors.blue,
                        size: 25.0,
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                            top: 0, bottom: 0, left:15.0, right: 0.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Condition d'utilisation",
                              style: TextStyle(fontSize: 16,color: Colors.white,fontFamily: 'Raleway'),
                            ),

                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),

            SizedBox(
              height: 25,
            ),
            Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.info,
                        color: Colors.blue,
                        size: 25.0,
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                            top: 0, bottom: 0, left:15.0, right: 0.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Information sur l'application",
                              style: TextStyle(fontSize: 16,color: Colors.white,fontFamily: 'Raleway'),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "Des question? Besoin d'aide?",
                              style: TextStyle(color: Colors.grey,fontFamily: 'Raleway'),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
