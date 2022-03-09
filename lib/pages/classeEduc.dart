import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

 class classeEducation extends StatefulWidget {
   const classeEducation({Key? key}) : super(key: key);

   @override
   _classeEducationState createState() => _classeEducationState();
 }



 class _classeEducationState extends State<classeEducation> {


   List contenu = [];
   bool isLoadibg = false;
   var  cycle;
   var data;


   @override
   void initState() {
     // TODO: implement initState
     super.initState();

     Future.delayed(Duration.zero, () {
       setState(() {
         data = ModalRoute.of(context)!.settings.arguments;
       });
       //print(data['cycle']);
       cycle = data['cycle'];
       this.fetchContenu(cycle);

     });
   }




   fetchContenu(cycle) async {

     String url = 'http://app.mobile.cg-mayele.com/json/classe?cycle=$cycle';

     var response = await http.get(Uri.parse(url));

     //print(response.statusCode);
     if (response.statusCode == 200) {
       var items = json.decode(response.body)['CLASSE'];

       setState(() {

         contenu = items;
         isLoadibg=true;
       });
     } else {
       setState(() {
         contenu = [];
       });
     }
   }






   @override
   Widget build(BuildContext context) {
     Widget child;


     if (isLoadibg==false) {
       child = Container(
         child: Scaffold(
           appBar: AppBar(
             title: Text('Classes',style: TextStyle(fontFamily: 'Raleway')),
             elevation: 4,
             shadowColor:const Color(0xFFA2C7F1).withOpacity(0.5),
             backgroundColor: Colors.black,
           ),
           backgroundColor: Colors.black,
           body: getCardNotConnection(),

         )

       );
     } else {
       child =   Container(
         child: Scaffold(
           appBar: AppBar(
             title: Text('Classes',style: TextStyle(fontFamily: 'Raleway')),
             elevation: 4,
             shadowColor:const Color(0xFFA2C7F1).withOpacity(0.5),
             backgroundColor: Colors.black,
           ),
           backgroundColor: Colors.black,
           body: ClasseBody(context),

         ),
       );
     }

     return new Container(child: child);
     return Scaffold(
       appBar: AppBar(
         title: Text('Classes',style: TextStyle(fontFamily: 'Raleway')),
         elevation: 4,
         shadowColor:const Color(0xFFA2C7F1).withOpacity(0.5),
         backgroundColor: Colors.black,
       ),
       backgroundColor: Colors.black,
       body: ClasseBody(context),

     );
   }

   Widget getCardNotConnection(){
     return Center(child: CircularProgressIndicator());
   }

   Widget ClasseBody(context){
     return  Container(

       child: ListView.builder(
           itemCount: contenu.length,
           itemBuilder: (context, index) {
             return getCard(context,contenu[index]);
           }),
     );

   }



   Widget getCard(context,index){

     var idClasse = index['id'];
     var picture = index['image_url'];
     var pictureuri =
         "http://app.mobile.cg-mayele.com/uploads/file/cours/$picture";

     return Padding(
       padding: const EdgeInsets.all(8.0),
       child: Column(

         children: [

           Container(

               margin: const EdgeInsets.fromLTRB(0, 5.0, 0, 5.0),
               width: double.infinity,
               height: 170.0,
               decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(8.0),
                   color: Colors.grey
               ),

               child: GestureDetector(

                 onTap: () {
//Navigator.push(context, MaterialPageRoute(builder: (context)=>videoLearnPage(index)));
                   //Navigator.of(context).pushNamed(videoLearnpage.routeName, arguments:  contenu[index]);

                   Navigator.pushNamed(context, '/matiere',arguments: {
                     'picture': pictureuri,
                     'idClasse':idClasse

                   });


                   // Navigator.of(context).push(MaterialPageRoute(builder: (context)=> videoLearnPage(contenuModel: contenu[index])));
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
                         boxShadow: [
                           BoxShadow(
                               color: Colors.grey.withOpacity(0.5),
                               spreadRadius: 1,
                               blurRadius: 1,
                               offset: Offset(0,1)
                           )
                         ]
                     ),

                   ),
                   placeholder: (context, url) => SizedBox(
                     child: Center(child: CircularProgressIndicator()),
                     height: 50.0,
                     width: 50.0,
                   ),
                   errorWidget: (context, url, error) => Icon(Icons.error),
                 ),
               )



           )
         ],


       ),
     );

   }
 }

