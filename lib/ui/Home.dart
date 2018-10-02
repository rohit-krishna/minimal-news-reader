import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'utils.dart' as utils;
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'newspage.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
//
//  void showNews() async{
//    Map _newsContent = await getNews(utils.appID);
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: new AppBar(
        elevation: 0.02,
        backgroundColor: Colors.white,
        title: new Text("READ LIST",
        style: appBarStyle()),
        centerTitle: true,
        leading: new IconButton(icon: Icon(Icons.menu), onPressed: null,
        color: Colors.black,),
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.search), onPressed:()=>debugPrint(""),
            color: Colors.black,)
        ],
      ),

        body: new Container(
            color: Colors.white,
            padding: EdgeInsets.all(6.0),
            child: updatedNews(),
      )

    );
  }
  Future<Map> getNews(String appId) async{
    String appUrl = "https://newsapi.org/v2/top-headlines?country=${utils.countryID}&apiKey=${utils.appID}";
    http.Response response = await http.get(appUrl);

    return json.decode(response.body);
  }

  Widget updatedNews(){
    return FutureBuilder(
      future: getNews(utils.appID),
      builder: (BuildContext context, AsyncSnapshot<Map> snapshot){
        Map content = snapshot.data;

        if(snapshot.hasData)
        {
          return new ListView.builder(
              itemBuilder: (BuildContext context, int position) {
            return Column(
              children: <Widget>[
                Padding(
                  padding:new EdgeInsets.fromLTRB(0.0, 15.0, 20.0, 0.0),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          title: Text("${content['articles'][position]['title']}",
                                  style: headingStyle()),
                subtitle: Text("By ${content['articles'][position]['source']['name']}",
                  style: subtitleStyle()),
                          leading: Image.network("${content['articles'][position]['urlToImage']}",
                                height: 100.0,
                                width: 100.0,
                            fit: BoxFit.cover,),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => newspage( newsTitle: content['articles'][position]),
                              ),
                            );
                          },

                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
//

                      ],
                    ),
                ),
                Divider(
                  height: 6.0,
                  indent: 10.0,
                )
              ],
            );
          },
            itemCount: 20,);
          }else{
          return new Container(
            child: new Center(
              child: SpinKitCubeGrid(
                color: Colors.black54,
                size: 50.0,
              ),
            ),
          );
        }
      },);
  }



}

//appbar style
TextStyle appBarStyle(){
  return TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w400,
    fontSize: 20.0,
    fontStyle: FontStyle.normal,
    wordSpacing: 3.0
  );
}

TextStyle headingStyle(){
  return TextStyle(
    fontFamily: "HB",
    fontSize: 18.0,
    fontWeight: FontWeight.w600
  );
}

TextStyle subtitleStyle(){
  return TextStyle(
      height: 2.0,
      fontFamily: "HB",
      fontSize: 9.0,
      fontWeight: FontWeight.w300
  );
}