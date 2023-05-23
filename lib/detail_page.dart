import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final String word;
  final Iterable<Iterable<String?>> definitions;
  final Iterable<String?> partofspeech;
  final Iterable<Iterable<dynamic>> synonyms;
  final Iterable<Iterable<dynamic>> antonyms;
  final int index;
  const DetailPage({Key? key, required this.word, required this.definitions, required this.partofspeech, required this.index, required this.antonyms, required this.synonyms }) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    // print(widget.antonyms);
    final antonymsLength = widget.antonyms.length;
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Page"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(20, 20, 0, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Text(widget.word,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: widget.partofspeech.length,
                itemBuilder: (BuildContext context, int index){
                  int i = index;
                  print(widget.antonyms.elementAt(i).isEmpty);
                  return Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: Text("${widget.partofspeech.elementAt(index)}",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              color: Colors.blue
                            ),
                          ),
                        ),
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: widget.definitions.elementAt(i).length,
                            itemBuilder: (BuildContext context, int index){
                              return Container(
                                  child: Text("${widget.definitions.elementAt(i).elementAt(index)}",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              );
                            }
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            widget.antonyms.elementAt(i).isEmpty ? Container() : Container(
                              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Text("Antonyms",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                            ListView.builder(
                              // scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: widget.antonyms.elementAt(i).length,
                                itemBuilder: (BuildContext context, int index){
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("${widget.antonyms.elementAt(i).elementAt(index)}",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ],
                                  );
                                }
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            widget.synonyms.elementAt(i).isEmpty ? Container() : Container(
                              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Text("Synonyms",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                            ListView.builder(
                              // scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: widget.synonyms.elementAt(i).length,
                                itemBuilder: (BuildContext context, int index){
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("${widget.synonyms.elementAt(i).elementAt(index)}",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ],
                                  );
                                }
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                }
            ),
          ],
        ),
      ),
    );
  }
}
