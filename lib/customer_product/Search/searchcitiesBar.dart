import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:fluttericon/linecons_icons.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:guido/constants/colors.dart';
import 'package:guido/customer_product/Search/searchAdList.dart';
import 'package:guido/customer_product/Search/searchpage.dart';
import 'package:guido/customer_product/screens/afterinfopage.dart';
import 'package:line_icons/line_icons.dart';
import 'package:textfield_search/textfield_search.dart';
import 'dart:math' as math;

import '../../models/citiesdataModel.dart';

Future<List<Cities>> fetchData() async {
  final jsonData = await rootBundle.rootBundle.loadString('json/in.json');

  return parseData(jsonData);
}

List<Cities> parseData(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Cities>((json) => Cities.fromJson(json)).toList();
}

class SearchLoader extends StatefulWidget {
  const SearchLoader({super.key});

  @override
  State<SearchLoader> createState() => _SearchLoaderState();
}

class _SearchLoaderState extends State<SearchLoader> {
  // List<String> cityNames = List.filled(406, '');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Cities>>(
          future: fetchData(),
          builder: (_, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text('An error has occurred!'),
              );
            } else if (snapshot.hasData) {
              return SearchDataCities(cities: snapshot.data!);
            } else {
              return const Center(
                child: CircularProgressIndicator(
                  strokeWidth: 1,
                  color: Colors.amberAccent,
                ),
              );
            }
          }),
    );
  }
}

List<String> onlycityNames = [];
List<String> transfer(List<String> cityNames) {
  onlycityNames = cityNames;
  return onlycityNames;
}

class SearchDataCities extends StatefulWidget {
  final List<Cities> cities;
  SearchDataCities({super.key, required this.cities});

  @override
  State<SearchDataCities> createState() => _SearchDataCitiesState();
}

class _SearchDataCitiesState extends State<SearchDataCities> {
  List<String> cityNames = List.filled(405, '');
  void citynames() {
    int i = 0;
    while (cityNames.last == '') {
      cityNames[i] = widget.cities[i].city;
      i++;
    }
  }
  @override
  void initState() {
    super.initState();
    citynames();
    transfer(cityNames);
  }

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Hero(
            tag: 'search',
            child: Container(
              decoration: BoxDecoration(
                  border: GradientBoxBorder(
                    gradient: LinearGradient(colors: [orange, yellow]),
                    width: 0.7,
                  ),
                  borderRadius: BorderRadius.circular(10)),
              child: SizedBox(
                height: 50,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Transform(
                            alignment: Alignment.center,
                            transform: Matrix4.rotationY(math.pi),
                            child: Icon(
                              LineariconsFree.cross,
                              size: 20,
                              color: Colors.black.withOpacity(0.7),
                            )),
                      ),
                    ),
                    Flexible(
                      child: Column(
                        children: [
                          TextFieldSearch(
                            minStringLength: 0,
                            itemsInView: 10,
                            label: '',
                            controller: searchController,
                            initialList: transfer(cityNames),
                            decoration: const InputDecoration(border: InputBorder.none),
                          ),
                        ],
                      ),

                      // child: TextField(
                      //   onTap: () {
                      //     //  showSearch(context: context, delegate: PageSearchDelegate());

                      //   },
                      //   cursorWidth: 0.5,
                      //   decoration: InputDecoration(border: InputBorder.none),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SearchAdList(
                                      result: searchController.text)));
                        },
                        child: Transform(
                            alignment: Alignment.center,
                            transform: Matrix4.rotationY(math.pi),
                            child: Icon(
                              LineIcons.search,
                              size: 20,
                              color: Colors.black.withOpacity(0.7),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
//icon search

class PageSearchDelegate extends SearchDelegate<String> {
  List<String> cityNames = onlycityNames;
  @override
  ThemeData appBarTheme(BuildContext context) {
    final theme = Theme.of(context);
    return theme.copyWith(
      appBarTheme:
          theme.appBarTheme.copyWith(backgroundColor: white, elevation: 0),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      GestureDetector(
          onTap: () {
            query = '';
          },
          child: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> cities = cityNames;
    List<String> matchQuery = [];
    for (var res in cities) {
      if (res.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(res);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(
            title: Text(result),
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> cities = cityNames;
    List<String> matchQuery = [];
    for (var res in cities) {
      if (res.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(res);
      }
    }
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
          itemCount: matchQuery.length,
          itemBuilder: (context, index) {
            var result = matchQuery[index];
            return GestureDetector(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    child: Text(
                  result,
                  style: TextStyle(fontWeight: FontWeight.w300),
                  textScaleFactor: 0.8,
                )),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => SearchAdList(
                              result: result,
                            )));
                close(context, '');
              },
            );
          }),
    );
  }
}
