import 'package:flutter/material.dart';

class grideducationPage extends StatelessWidget {
  const grideducationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*return
      GridView.count(

        crossAxisCount: 2,
        children: [
          Container(
            height: 250.0,

            child: Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,

              child: Image.asset('images/slider1.jpg',fit: BoxFit.cover),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 5,

            ),
          ),
          Container(
            height: 220.0,

            child: Card(

              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,

              child: Image.asset('images/slider1.jpg',fit: BoxFit.cover),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 5,

            ),
          ),

        ],
      )
    ;*/

    return Row(
      children: [
        Expanded(
            flex: 6,
            child: GestureDetector(

              child: Container(
                margin: EdgeInsets.only(top: 0, bottom: 5, left: 5, right: 5),
                width: 175,
                height: 220,

                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                        image: AssetImage('images/educ1.jpg'),
                        fit: BoxFit.cover),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 0.5,

                          offset: Offset(0,0.5)
                      )
                    ]
                ),


              ),

              onTap: () {

                Navigator.pushNamed(context, '/cycle',arguments: {

                });


                // Navigator.of(context).push(MaterialPageRoute(builder: (context)=> videoLearnPage(contenuModel: contenu[index])));
              },
            )),

        Expanded(
            flex: 6,
            child: GestureDetector(

              child: Container(
                margin: EdgeInsets.only(top: 0, bottom: 5, left: 5, right: 5),
                width: 175,
                height: 220,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                        image: AssetImage('images/educ2.jpg'),
                        fit: BoxFit.cover),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 0.5,

                          offset: Offset(0,0.5)
                      )
                    ]

                ),
              ),

              onTap: () {

                Navigator.pushNamed(context, '/typecontenu',arguments: {

                });
              },
            )),
      ],
    );
  }
}
