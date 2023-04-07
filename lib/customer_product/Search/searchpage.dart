import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:guido/constants/colors.dart';
import 'package:guido/constants/container.dart';

class SearchResultsData extends StatefulWidget {
  final String cityName;
  final String uid;

  const SearchResultsData({super.key, required this.cityName, required this.uid});

  @override
  State<SearchResultsData> createState() => _SearchResultsDataState();
}

class _SearchResultsDataState extends State<SearchResultsData> {
  @override
  Widget build(BuildContext context) {
    return SearchPage(cityName: widget.cityName);
  }
}

class SearchPage extends StatefulWidget {
  final String id = '/search_page)';
  final String cityName;
  const SearchPage({super.key, required this.cityName});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int resultsfound = 9;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              decoration: BoxDecoration(
                  border: GradientBoxBorder(
                    gradient: LinearGradient(colors: [orange, yellow]),
                    width: 0.7,
                  ),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: const AbsorbPointer(
                            child: Padding(
                              padding: EdgeInsets.all(2.0),
                              child: Icon(
                                Icons.arrow_back,
                                size: 15,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(widget.cityName),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: GradientBoxBorder(
                          gradient: LinearGradient(colors: [orange, yellow]),
                          width: 0.7,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: const [
                              Icon(
                                Icons.calendar_today,
                                size: 15,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                '29-aug-23',
                                textScaleFactor: 0.8,
                              )
                            ],
                          ),
                        ),
                        Spacer(),
                        VerticalDivider(
                          thickness: 1,
                          width: 5,
                          color: yellow,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.people),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                '2 guest',
                                textScaleFactor: 0.8,
                              )
                            ],
                          ),
                        ),
                        Spacer()
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // make filters here

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              '$resultsfound results found',
              style: TextStyle(fontWeight: FontWeight.w600),
              textScaleFactor: 0.9,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Cardforsearchpage(
                    const Text(
                      'From \$100 / person',
                      style: TextStyle(fontWeight: FontWeight.w500),
                      textScaleFactor: 0.5,
                    ),
                    Text(
                      'Hiking to the lovers Point ',
                      style: GoogleFonts.libreBaskerville(
                          textStyle: const TextStyle()),
                      textScaleFactor: 0.8,
                    ),
                    const Text(
                      'specail Veiw points at sunrise',
                      textScaleFactor: 0.5,
                    ),
                    imageUrl: 'lib/images/place2.png',
                  ),
                  Cardforsearchpage(
                    const Text(
                      'From \$30 / person',
                      style: TextStyle(fontWeight: FontWeight.w500),
                      textScaleFactor: 0.5,
                    ),
                    Text(
                      'Amazing Cultural Experience in Manali ',
                      style: GoogleFonts.libreBaskerville(
                          textStyle: const TextStyle()),
                      textScaleFactor: 0.8,
                    ),
                    const Text(
                      'Get to attended indian wedding ',
                      textScaleFactor: 0.5,
                    ),
                    imageUrl: 'lib/images/place1.png',
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Cardforsearchpage(
                    const Text(
                      'From \$70 / person',
                      style: TextStyle(fontWeight: FontWeight.w500),
                      textScaleFactor: 0.5,
                    ),
                    Text(
                      'A trail to the Manalis\' unseen beauty',
                      style: GoogleFonts.libreBaskerville(
                          textStyle: const TextStyle()),
                      textScaleFactor: 0.8,
                    ),
                    const Text(
                      'full meal and bed',
                      textScaleFactor: 0.5,
                    ),
                    imageUrl: 'lib/images/pic.png',
                  ),
                  Cardforsearchpage(
                    const Text(
                      'From \$42 / person',
                      style: TextStyle(fontWeight: FontWeight.w500),
                      textScaleFactor: 0.5,
                    ),
                    Text(
                      'Most beautiful view points with our package',
                      style: GoogleFonts.libreBaskerville(
                          textStyle: const TextStyle()),
                      textScaleFactor: 0.8,
                    ),
                    const Text(
                      'Full 3 time meal',
                      textScaleFactor: 0.5,
                    ),
                    imageUrl: 'lib/images/place1.png',
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Cardforsearchpage(
                    const Text(
                      'From \$10 / person',
                      style: TextStyle(fontWeight: FontWeight.w500),
                      textScaleFactor: 0.5,
                    ),
                    Text(
                      'A trail to the Himalayas unseen beauty',
                      style: GoogleFonts.libreBaskerville(
                          textStyle: const TextStyle()),
                      textScaleFactor: 0.8,
                    ),
                    const Text(
                      'Full 3 time meal',
                      textScaleFactor: 0.5,
                    ),
                    imageUrl: 'lib/images/place1.png',
                  ),
                  Cardforsearchpage(
                    const Text(
                      'From \$35 / person',
                      style: TextStyle(fontWeight: FontWeight.w500),
                      textScaleFactor: 0.5,
                    ),
                    Text(
                      'A trail to the Himalayas unseen beauty',
                      style: GoogleFonts.libreBaskerville(
                          textStyle: const TextStyle()),
                      textScaleFactor: 0.8,
                    ),
                    const Text(
                      '1 bed',
                      textScaleFactor: 0.5,
                    ),
                    imageUrl: 'lib/images/place2.png',
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Cardforsearchpage(
                    const Text(
                      'From \$25 / person',
                      style: TextStyle(fontWeight: FontWeight.w500),
                      textScaleFactor: 0.5,
                    ),
                    Text(
                      'A trail to the Himalayas unseen beauty',
                      style: GoogleFonts.libreBaskerville(
                          textStyle: const TextStyle()),
                      textScaleFactor: 0.8,
                    ),
                    const Text(
                      'Full 3 time meal',
                      textScaleFactor: 0.5,
                    ),
                    imageUrl: 'lib/images/place1.png',
                  ),
                  Cardforsearchpage(
                    const Text(
                      'From \$29/ person',
                      style: TextStyle(fontWeight: FontWeight.w500),
                      textScaleFactor: 0.5,
                    ),
                    Text(
                      'A trail to the Himalayas unseen beauty',
                      style: GoogleFonts.libreBaskerville(
                          textStyle: const TextStyle()),
                      textScaleFactor: 0.8,
                    ),
                    const Text(
                      'specail Veiw points at sunrise',
                      textScaleFactor: 0.5,
                    ),
                    imageUrl: 'lib/images/place1.png',
                  )
                ],
              ),
            ],
          ))
        ],
      )),
    );
  }
}
