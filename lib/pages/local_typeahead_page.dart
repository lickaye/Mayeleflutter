import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mayele/api/searchApi.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';




class LocalTypeAheadPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: Colors.black,

    body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: Colors.black,
            padding: EdgeInsets.all(0),
            child: TypeAheadField<Search?>(
              hideSuggestionsOnKeyboardHide: true,
              textFieldConfiguration: TextFieldConfiguration(
                style: TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  prefixIcon: Icon(Icons.search,color: Colors.white,),


                  hintText: 'Que recherchez vous?',
                  hintStyle: TextStyle(color: Colors.white),
                ),
              ),
              suggestionsCallback: SearchApi.getUserSuggestions,
              itemBuilder: (context, Search? suggestion) {
                final search = suggestion!;
                var serarch_img = search.imageName;
                var pictureuri =
                    "http://app.mobile.cg-mayele.com/uploads/file/contenu/$serarch_img";
                return ListTile(

                  leading: Container(
                    width: 60,
                    height: 60,

                    child: CachedNetworkImage(
                      imageUrl: pictureuri.toString(),
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          color: const Color(0xffbac0c7),
                          borderRadius: BorderRadius.all(Radius.circular(7.0)),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                          border: Border.all(
                            color: Colors.white,
                            width: 2.0,
                          ),
                        ),
                      ),
                      placeholder: (context, url) => SizedBox(
                        child: Center(child: CircularProgressIndicator()),
                        height: 50.0,
                        width: 50.0,
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                  title: Text(search.titre),
                );
              },
              noItemsFoundBuilder: (context) => Container(
                height: 100,
                child: Center(
                  child: Text(
                    'No Users Found.',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
              onSuggestionSelected: (Search? suggestion) {
                final user = suggestion!;

                /*Navigator.of(context).push(MaterialPageRoute(
                //builder: (context) => UserDetailPage(user: user),
              ));*/
              },
            ),
          ),
          Container(
            child: Image.asset('images/search.png',fit: BoxFit.cover,),
          )
        ],
      ),
    ),
  );
}



