import 'package:flutter/material.dart';

class CycleEducation extends StatelessWidget {
  const CycleEducation({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cycle',style: TextStyle(fontFamily: 'Raleway')),
        elevation: 4,
        shadowColor:const Color(0xFFA2C7F1).withOpacity(0.5),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: CycleBody(context),
    );

  }


  Widget CycleBody(context){
    return SingleChildScrollView(

      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(

              child: Container(
                width: double.infinity,
                  height: 170.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                          image: AssetImage('images/primaire.jpg'),
                          fit: BoxFit.cover),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: Offset(0,1)
                        )
                      ]
                  )

              ),

                onTap: () {

                  Navigator.pushNamed(context, '/classe',arguments: {
                    'cycle': '1',
                  });

                }
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              child: Container(
                  width: double.infinity,
                  height: 170.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                          image: AssetImage('images/college.jpg'),
                          fit: BoxFit.cover),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: Offset(0,1)
                        )
                      ])

              ),

                onTap: () {

                  Navigator.pushNamed(context, '/classe',arguments: {
                    'cycle': '2',
                  });

                }
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              child: Container(
                  width: double.infinity,
                  height: 170.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                          image: AssetImage('images/lycee.jpg'),
                          fit: BoxFit.cover),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: Offset(0,1)
                        )
                      ])
              ),

                onTap: () {

                  Navigator.pushNamed(context, '/classe',arguments: {
                    'cycle': '3',
                  });

                }
            ),
          )
        ],
      ),
    );

  }
}
