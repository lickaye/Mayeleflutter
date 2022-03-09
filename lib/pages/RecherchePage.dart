import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecherchePage extends StatefulWidget {



  const RecherchePage({Key? key}) : super(key: key);

  @override
  _RecherchePageState createState() => _RecherchePageState();
}

class _RecherchePageState extends State<RecherchePage> {
  late final String text;
  late final ValueChanged<String> onChanged;
  late final String hintText;

  final controller = TextEditingController();


  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(
          elevation: 4,
          shadowColor:const Color(0xFFA2C7F1).withOpacity(0.5),
          backgroundColor: Colors.black,
          title: Text("Que recherchez vous?",style: TextStyle(fontFamily: 'Raleway')),
          actions: [
            IconButton(onPressed: (){
                  showSearch(
                      context: context,
                      delegate: CustomSearch());
            },
                icon: Icon(Icons.search))
          ],


        ),
       backgroundColor: Colors.black,
      body: Container(
         child: Image.asset('images/search.png',fit: BoxFit.cover,),
      ),
    );
  }
}


class CustomSearch extends SearchDelegate {

  List<String> alldata = [
'America','Russia','China','England','Germany'
  ];


  @override
  List<Widget>? buildActions(BuildContext context) {

           return [
             IconButton(onPressed: (){
                  query ='';
             }, icon: const Icon(Icons.clear))
           ];
  }


  @override
  Widget? buildLeading(BuildContext context) {

   return IconButton(onPressed: (){
       close(context, null);
     }, icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    List<String> matchquery = [];

    for(var items in alldata){
      if(items.toLowerCase().contains(query.toLowerCase())){
        matchquery.add(items);
      }
    }
    return ListView.builder(
      itemCount: matchquery.length,
        itemBuilder: (context,index){
        var result = matchquery[index];
        return ListTile(
          tileColor: Colors.black,
          title: Text(result),
        );

        }
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

}

