import 'package:flutter/material.dart';




class SliderModulePage extends StatelessWidget {
  const SliderModulePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return  Container(
      height: 90,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 10.0),
            width: 90.0,
            height: 90.0,
            decoration: BoxDecoration(
              color: const Color(0xffbac0c7),
              image: DecorationImage(
                  image: AssetImage('images/educ1.jpg'),fit: BoxFit.cover
              ),
              borderRadius: BorderRadius.all( Radius.circular(50.0)),
              border: Border.all(
                color: Colors.white,
                width: 2.0,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 10.0),
            width: 90.0,
            height: 90.0,
            decoration: BoxDecoration(
              color: const Color(0xffbac0c7),
              image: DecorationImage(
                  image: AssetImage('images/educ1.jpg'),fit: BoxFit.cover
              ),
              borderRadius: BorderRadius.all( Radius.circular(50.0)),
              border: Border.all(
                color: Colors.white,
                width: 2.0,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 10.0),
            width: 90.0,
            height: 90.0,
            decoration: BoxDecoration(
              color: const Color(0xffbac0c7),
              image: DecorationImage(
                  image: AssetImage('images/educ1.jpg'),fit: BoxFit.cover
              ),
              borderRadius: BorderRadius.all( Radius.circular(50.0)),
              border: Border.all(
                color: Colors.white,
                width: 2.0,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 10.0),
            width: 90.0,
            height: 90.0,
            decoration: BoxDecoration(
              color: const Color(0xffbac0c7),
              image: DecorationImage(
                  image: AssetImage('images/educ1.jpg'),fit: BoxFit.cover
              ),
              borderRadius: BorderRadius.all( Radius.circular(50.0)),
              border: Border.all(
                color: Colors.white,
                width: 2.0,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 10.0),
            width: 90.0,
            height: 90.0,
            decoration: BoxDecoration(
              color: const Color(0xffbac0c7),
              image: DecorationImage(
                  image: AssetImage('images/educ1.jpg'),fit: BoxFit.cover
              ),
              borderRadius: BorderRadius.all( Radius.circular(50.0)),
              border: Border.all(
                color: Colors.white,
                width: 2.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
