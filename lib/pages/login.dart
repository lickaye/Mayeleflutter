import 'package:flutter/material.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({Key? key}) : super(key: key);

  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {

   static const imgBg = "images/login-bg.jpg";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.black,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(imgBg), fit: BoxFit.cover),
        ),
        child: Column(

          children: [
            SizedBox(
              height: 40.0,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: Center(
                child: Text(
                  "Se connecter",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 19.0,
                      fontFamily: 'Raleway'),
                ),
              ),
            ),

            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(right: 15, left: 15),
              child:   ElevatedButton.icon(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Color(0xFF1375bb)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            side: BorderSide(color: Color(0xFF1375bb))
                        )
                    )
                ),

                icon: Icon(Icons.facebook),
                label: Text('Facebook'),
                onPressed: () {
                  Navigator.pushNamed(context, '/loginpage', arguments: {

                  });
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
              width: double.infinity,
              child:   ElevatedButton.icon(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            side: BorderSide(color: Colors.red)
                        )
                    )
                ),

                icon: Icon(Icons.g_mobiledata),
                label: Text('Google'),
                onPressed: () {
                  Navigator.pushNamed(context, '/loginpage', arguments: {

                  });
                },
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Expanded(
                child: Divider(
                  indent: 20.0,
                  endIndent: 10.0,
                  thickness: 1,
                  color: Colors.grey,
                ),
              ),
              Text(
                "OR",
                style: TextStyle(color: Colors.grey),
              ),
              Expanded(
                child: Divider(
                  indent: 10.0,
                  endIndent: 20.0,
                  thickness: 1,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                cursorColor: Colors.white,
                style: TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  labelText: 'Enter your username',
                  labelStyle: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                cursorColor: Colors.white,
                style: TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.white),
                ),
              ),
            ),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
              width: double.infinity,
              child:   ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(const Color(0xFF2daae1)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            side: BorderSide(color: const Color(0xFF2daae1))
                        )
                    )
                ),

               
                onPressed: () {
                  Navigator.pushNamed(context, '/loginpage', arguments: {

                  });
                }, child: Text('Se connecter'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
