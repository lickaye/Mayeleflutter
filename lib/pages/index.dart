import 'package:bottom_navy_bar/bottom_navy_bar.dart';

import 'package:flutter/material.dart';
import 'package:mayele/pages/CarouselPage.dart';
import 'package:mayele/pages/grideducationPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mayele',
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    int _currentIndex = 0;
    int _counter = 0;
    String _value = '';

    void initState(){

    };

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body:  SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200.0,
              child: CarouselPage(),
            ),

            Container(

                child: Text('Education',style: TextStyle(color: Colors.white,fontSize: 20,height: 4.0),textAlign: TextAlign.left,)

            ),

            Container(

              height: 250,
              child: grideducationPage(),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        backgroundColor: Colors.black,
        selectedIndex: _currentIndex,
        showElevation: true,
        itemCornerRadius: 24,
        curve: Curves.easeIn,
        onItemSelected: (index) {
          setState(() {
            _currentIndex =index;
            _value = 'click sur ${ index.toString()}';
          });
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: Icon(Icons.home),
            title: Text('Accueil'),
            activeColor: Colors.blue,
            inactiveColor: Colors.white,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.search),
            title: Text('Recheche'),
            activeColor: Colors.blue,
            inactiveColor: Colors.white,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.photo),
            title: Text('Biothèque'),
            activeColor: Colors.blue,
            inactiveColor: Colors.white,
            textAlign: TextAlign.center,
          ),

          BottomNavyBarItem(
            icon: Icon(Icons.settings),
            title: Text('parametres'),
            activeColor: Colors.blue,
            inactiveColor: Colors.white,
            textAlign: TextAlign.center,
          ),
        ],
      ),


    );
  }

}

/*
ListView(
        children: [
          SizedBox(
            height: 200.0,
            width: double.infinity,
            child: Carousel(
              dotSize: 4.0,
              dotSpacing: 15.0,
              dotColor: Colors.lightGreenAccent,
              indicatorBgPadding: 5.0,
              dotBgColor: Colors.transparent,
              dotVerticalPadding: 5.0,
              dotPosition: DotPosition.bottomRight,
              images: [
                Image.asset('images/slider1.jpg',fit: BoxFit.cover,),
                Image.asset('images/slider2.jpg',fit: BoxFit.cover),
                Image.asset('images/slider3.jpg',fit: BoxFit.cover),
              ],
            ),
          ),
Positioned(
  top: 30,
  left: 30,
  child: Container(
    width: 100.0,
    height: 80,
    decoration: BoxDecoration(color: Colors.red),
  )
)
        ],
      ),
 */






