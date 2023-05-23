import 'package:flutter/material.dart';
import 'package:tugasakhirtpm/api/data_source.dart';
import 'package:tugasakhirtpm/detail_page.dart';
import 'package:tugasakhirtpm/model/products_model.dart';
import 'package:tugasakhirtpm/pref/shared_preference.dart';


class HomePage extends StatefulWidget {
  final String username;
  const HomePage({Key? key, required this.username}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search Result"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: _buildDetailCountriesBody(),
    );
  }

  Widget _buildDetailCountriesBody() {
    return Container(
      child: FutureBuilder(
        future: DataSource.instance.loadMakeup(widget.username),
        builder: (
            BuildContext context,
            AsyncSnapshot<dynamic> snapshot,
            ) {
          if (snapshot.hasError) {
            return _buildErrorSection();
          }
          if (snapshot.hasData) {
            List<ProductsModel>? productsModel = snapshot.data;
            if (snapshot.data!.isNotEmpty) {
              return _buildSuccessSection(productsModel);
            }
          }
          return _buildLoadingSection();
        },
      ),
    );
  }

  Widget _buildErrorSection() {
    return Text("Error");
  }
  Widget _buildEmptySection() {
    return Text("Empty");
  }
  Widget _buildLoadingSection() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
  Widget _buildSuccessSection(List<ProductsModel>? data) {
    return ListView.builder(
      itemCount: data!.length,
      itemBuilder: (BuildContext context, int index) {
        final definitons = data[index].meanings!.map((e) => e.definitions!.map((e) => e.definition));
        // final definitons2 = data[index].meanings!.map((e) => e.definitions.);
        final partofspeech = data[index].meanings!.map((e) => e.partOfSpeech);
        final synonyms = data[index].meanings!.map((e) => e.synonyms!.map((e) => e));
        final antonyms = data[index].meanings!.map((e) => e.antonyms!.map((e) => e));
        final phonetics = data[index].phonetics!.map((e) => e.text);
        // print(items);
        return _buildItemCountries(index, "${data[index].word}", definitons, partofspeech, synonyms, antonyms, phonetics);
      },
    );
  }

  Widget _buildItemCountries(int i, String word, Iterable<Iterable<String?>> definitions, Iterable<String?> partofspeech, Iterable<Iterable<dynamic>> synonyms, Iterable<Iterable<dynamic>> antonyms, Iterable<String?> phonetic) {
    // String phon = phonetic. ? "${phonetic.first}" : "";
    return InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return DetailPage(word: word,
                definitions: definitions,
                partofspeech: partofspeech,
                index: i,
                antonyms: antonyms,
                synonyms: synonyms);
          }));
        },
        child: Card(
          margin: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10
          ),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 5, 0, 15),
                  child: Text(word,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),),
                ListView.builder(
                    shrinkWrap: true,
                    // partofspeech.length
                    itemCount: 1,
                    itemBuilder: (BuildContext context, int index) {
                      int i = index;
                      return Text("${definitions
                          .elementAt(i)
                          .first}");
                    }
                ),
              ],
            ),
          ),
        )
    );
  }}

