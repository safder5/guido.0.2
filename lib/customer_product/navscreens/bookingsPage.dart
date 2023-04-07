import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:guido/constants/colors.dart';
import 'package:guido/customer_product/bookingpages/partActive.dart';
import 'package:guido/customer_product/bookingpages/partCancelled.dart';
import 'package:guido/customer_product/bookingpages/partPast.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class BookingsPage extends StatefulWidget {
  const BookingsPage({super.key});

  @override
  State<BookingsPage> createState() => _BookingsPageState();
}

class _BookingsPageState extends State<BookingsPage> with SingleTickerProviderStateMixin{
 late TabController _tabs ;


  @override
  void initState() {
    super.initState();
    _tabs = TabController(
      vsync: this,
      length: 3,
    );
  }
  @override
  void dispose() {
    super.dispose();
    _tabs.dispose();
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Booking',
              style: TextStyle(fontWeight: FontWeight.w300),
              textScaleFactor: 1.2,
            ),
          ),
          DefaultTabController(
              length: 3,
              initialIndex: 0,
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Material(
                          color: white,
                          child: TabBar(
                            // overlayColor: ,
                            controller: _tabs,
                            padding: EdgeInsets.zero,
                            indicatorPadding: EdgeInsets.zero,
                            labelPadding:
                                const EdgeInsets.only(right: 12, left: 12),
                            isScrollable: true,
                            labelStyle: const TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 12),
                            indicatorColor: yellow,
                            tabs: const [
                              Tab(
                                text: "Active",
                              ),
                              Tab(
                                text: "Past",
                              ),
                              Tab(
                                text: "Cancelled",
                              ),
                            ],
                            labelColor: Colors.black,
                            unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w300),
                            indicator: MaterialIndicator(
                              strokeWidth: 0.5,
                              height: 0.5,
                              color: orange,
                              topLeftRadius: 8,
                              topRightRadius: 8,
                              horizontalPadding: 0,
                              paintingStyle: PaintingStyle.fill,
                              tabPosition: TabPosition.bottom,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                      ]))),
          Expanded(
              child: TabBarView( 
                controller: _tabs,
                children: const [
             Center(
              child: PartActiveBooking()
            ),
             Center(
              child: PartPastBooking()
            ),
             Center(
              child: PartCancelledBooking()
            ),
          ]))
        ],
      ),
    ));
  }
}


