import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import 'package:mayele/pages/CarouselPage.dart';
import 'package:mayele/pages/ContenutypeModulePage.dart';
import 'package:mayele/pages/CoursPages.dart';
import 'package:mayele/pages/DetailcarouselVideo.dart';
import 'package:mayele/pages/Matiere.dart';
import 'package:mayele/pages/ReadPdfCours.dart';

import 'package:mayele/pages/RecherchePage.dart';
import 'package:mayele/pages/SliderDivertissementPage.dart';
import 'package:mayele/pages/SliderEmploiPage.dart';
import 'package:mayele/pages/SliderEntreprenariatpage.dart';
import 'package:mayele/pages/SliderFormationPage.dart';
import 'package:mayele/pages/SliderModulePage.dart';
import 'package:mayele/pages/YoutubeVideoPlayerPage.dart';

import 'package:mayele/pages/bibiothequeVideoPage.dart';
import 'package:mayele/pages/carouselSlider.dart';
import 'package:mayele/pages/classeEduc.dart';
import 'package:mayele/pages/cyleEducation.dart';
import 'package:mayele/pages/grideducationPage.dart';
import 'package:mayele/pages/local_typeahead_page.dart';
import 'package:mayele/pages/login.dart';
import 'package:mayele/pages/parametrePage.dart';
import 'package:mayele/pages/pubOnePage.dart';
import 'package:mayele/pages/pubThree.dart';
import 'package:mayele/pages/pubTwo.dart';
import 'package:mayele/pages/readCoursePage.dart';
import 'package:mayele/pages/testslider.dart';
import 'package:mayele/pages/typeContenuPage.dart';
import 'package:mayele/pages/videoLearnPage.dart';

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
      home: MyHomePage(),
      routes: {
        '/videdo': (context) => videoLearnPage(),
        '/cycle': (context) => CycleEducation(),
        '/classe': (context) => classeEducation(),
        '/matiere': (context) => Matiere(),
        '/cours': (context) => CoursPages(),
        '/typecontenu': (context) => typeContenuPage(),
        '/contenutypemodule': (context) => ContenutypeModulePage(),
        '/readpdfcours': (context) => ReadPdfCours(),
        '/bibiothequevideo': (context) => bibiothequeVideoPage(),
        '/youtubeplayer': (context) => Youtubeplayer(),
        '/carouselpage': (context) => carouselSlider(),
        '/carouseldetail': (context) => DetailCarouselVideo(),
        '/readcourse': (context) => readcoursePage(),
        '/loginpage': (context) => Loginpage()

      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: [
          buildPage(),
        ],
      ),
      bottomNavigationBar: BottomNavidator(),
    );
  }

  Widget buildPage() {
    switch (index) {
      case 1:
        return LocalTypeAheadPage();
      case 2:
        return bibiothequeVideoPage();
      case 3:
        return parametrePage();
      case 0:
      default:
        return buidBody();
    }
  }

  Widget BottomNavidator() {
    int _currentIndex = 0;
    int _counter = 0;

    String _value = '';

    return BottomNavyBar(
      backgroundColor: Colors.black,
      selectedIndex: index,
      showElevation: true,
      itemCornerRadius: 24,
      curve: Curves.easeIn,
      onItemSelected: (index) => setState(() => this.index = index),
      items: <BottomNavyBarItem>[
        BottomNavyBarItem(
          icon: Icon(Icons.home),
          title: Text('Accueil', style: TextStyle(fontFamily: 'Raleway')),
          activeColor: const Color(0xFF2daae1),
          inactiveColor: Colors.white,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.search),
          title: Text('Recheche', style: TextStyle(fontFamily: 'Raleway')),
          activeColor: const Color(0xFF2daae1),
          inactiveColor: Colors.white,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.camera),
          title: Text('Bibiothèque', style: TextStyle(fontFamily: 'Raleway')),
          activeColor: const Color(0xFF2daae1),
          inactiveColor: Colors.white,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.settings),
          title: Text('Parametres', style: TextStyle(fontFamily: 'Raleway')),
          activeColor: const Color(0xFF2daae1),
          inactiveColor: Colors.white,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget buidBody() {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200.0,
                child: carouselSlider(),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20.0,left: 8.0),
                height: 22,
                child:  Text(
                  'Tous les modules',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 18.0),
                height: 90.0,
                child: SliderModulePage(),
              ),
              Container(
                margin: const EdgeInsets.only(top: 25.0),
                height: 270.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Education',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    grideducationPage(),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 18.0,bottom: 22.0),
                height: 230.0,
                child: pubOnePage(),
              ),
              Container(
                height: 250.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Formation',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SliderFormationPage()
                  ],
                ),
              ),
              Container(
                height: 250.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Entreprenariat',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SliderEntreprenariatPage()
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 18.0,bottom: 22.0),
                height: 230.0,
                child: pubTwo(),
              ),
              Container(
                height: 250.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Emploi',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SliderEmploiPage()
                  ],
                ),
              ),
              Container(
                height: 250.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Divertissement',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SliderDivertissementPage()
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 18.0,bottom: 22.0),
                height: 230.0,
                child: pubthree(),
              ),
            ],
          ),
        ),
        Positioned(
          top: 0.0,
          left: 0.0,
          right: 0.0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 45.0,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: const Color(0xFF333430).withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: Offset(0, 1))
            ]),
            child: Row(
              children: [
                Container(
                  height: 50.0,
                  child: Image.asset(
                    "images/flutter_logo_mayele.png",
                    width: 100,
                  ),
                ),
                Spacer(),
                ElevatedButton.icon(
                  style: ButtonStyle(
                   backgroundColor: MaterialStateProperty.all(Color(0xFF1375bb)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Color(0xFF1375bb))
                          )
                      )
                  ),

                  icon: Icon(Icons.person),
                  label: Text('Connexion'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/loginpage', arguments: {

                    });
                  },
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
