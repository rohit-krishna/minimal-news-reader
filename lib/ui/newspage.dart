import 'package:flutter/material.dart';

import 'Home.dart';

class newspage extends StatefulWidget {
  final newsTitle;

  newspage({Key key, @required this.newsTitle}) : super(key: key);

  @override
  _newspageState createState() => _newspageState();
}

class _newspageState extends State<newspage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          elevation: 0.02,
          backgroundColor: Colors.white,
          title: new Text("News Page", style: appBarStyle()),
          centerTitle: true,
          actions: <Widget>[
            new IconButton(
              icon: Icon(Icons.search),
              onPressed: () => debugPrint(""),
              color: Colors.black,
            )
          ],
        ),
        body: Container(
          color: Colors.grey.shade50,
          child: new ListView(children: <Widget>[
            SizedBox(
              child: Container(
                child: Text(
                  "${widget.newsTitle['source']['name']}",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 12.0,
                  ),
                ),
                alignment: Alignment.topRight,
                padding: EdgeInsets.only(top: 10.0, right: 12.0),
              ),
            ),
            Divider(
              height: 10.0,
              indent: 10.0,
            ),

            Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        child: new Image.network(
                          "${widget.newsTitle['urlToImage']}",),
                      ),
                    ],
                  ),
                )),

            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 5.0, right: 5.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Container(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(14.0, 15.0, 0.0, 25.0),
                    child: Container(
                      child: Text("${widget.newsTitle['title']}",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                  color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 25.0,
                            fontFamily: 'HB',
                          )),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: new Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      "\"${widget.newsTitle['description']}\"",
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 15.0,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.only(left: 23.0,top: 8.0,bottom: 8.0),
              child: new Row(
                children: <Widget>[
                  Icon(Icons.person_outline,size: 15.0,),
                  SizedBox(width: 10.0,),
                  RichText(text: new TextSpan(
                    children:[
                      new TextSpan(text: "Author : ",style: TextStyle(color: Colors.black54)),
                      new TextSpan(text: "${widget.newsTitle['author']}",
                          style: TextStyle(color: Colors.red,fontStyle: FontStyle.italic))
                    ]
                  ))
                ],
              ),
            ),
            new Container(
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      alignment: Alignment.topCenter,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      padding: EdgeInsets.all(10.0),
                      child: new Text("${widget.newsTitle['content']}",
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 18.0,
                          fontStyle: FontStyle.normal,
                        ),),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 70.0,left: 4.8,right: 4.8),
                        child: ButtonTheme(
                          height: 75.0,
                          minWidth: MediaQuery.of(context).size.width,
                          child: Container(
                            color: Colors.white10.withOpacity(.60),
                            alignment: Alignment.bottomCenter,
                            child: RaisedButton(
                              padding: const EdgeInsets.only(top: 10.0),
                              color: Colors.teal, onPressed:()=>debugPrint(""),
                              child:  Text("Read Full Story",
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                    fontFamily: "HB"
                                ),),),
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 10.0,left: 4.8,right: 4.8),
                        child: ButtonTheme(
                          height: 75.0,
                          minWidth: MediaQuery.of(context).size.width,
                          child: Container(

                            color: Colors.grey,
                            alignment: Alignment.bottomCenter,
                            child: RaisedButton(
                              padding: const EdgeInsets.only(top: 10.0),
                              color: Colors.white70, onPressed:()=>debugPrint(""),
                              child:  Text("Follow",
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.teal,
                                    fontFamily: "HB"
                                ),),),
                          ),
                        ),
                      ),

                    ],
                  )

                ],
              ),
            )

          ]),
        ));
  }
}
