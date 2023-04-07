import 'package:flutter/material.dart';
import 'package:guido/bookkingProcess/guestspick.dart';
import 'package:guido/constants/buttons.dart';
import 'package:guido/constants/colors.dart';
import 'package:line_icons/line_icons.dart';
import 'package:scrollable_clean_calendar/controllers/clean_calendar_controller.dart';
import 'package:scrollable_clean_calendar/scrollable_clean_calendar.dart';
import 'package:scrollable_clean_calendar/utils/enums.dart';

class DateSelectionPage extends StatefulWidget {
  final String id = '/date_selection_page';
  const DateSelectionPage({super.key});

  @override
  State<DateSelectionPage> createState() => _DateSelectionPageState();
}

class _DateSelectionPageState extends State<DateSelectionPage> {
  final calendarController = CleanCalendarController(
    minDate: DateTime.now(),
    maxDate: DateTime.now().add(const Duration(days: 365)),
    onRangeSelected: (firstDate, secondDate) {},
    onDayTapped: (date) {},
    // readOnly: true,
    onPreviousMinDateTapped: (date) {},
    onAfterMaxDateTapped: (date) {},
    weekdayStart: DateTime.monday,
    // initialFocusDate: DateTime(2023, 5),
    // initialDateSelected: DateTime(2022, 3, 15),
    // endDateSelected: DateTime(2022, 3, 20),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  appBar: AppBar(
      //     title: const Text('Scrollable Clean Calendar'),
      //     actions: [
      //       IconButton(
      //         onPressed: () {
      //           calendarController.clearSelectedDates();
      //         },
      //         icon: const Icon(Icons.clear),
      //       ),
      //     FloatingActionButton(
      //   child: const Icon(Icons.arrow_downward),
      //   onPressed: () {
      //     calendarController.jumpToMonth(date: DateTime(2023, 1));
      //   },
      // ),
      //   ],
      // ),
      // floatingActionButton: FloatingActionButton(
      //   child: const Icon(Icons.arrow_downward),
      //   onPressed: () {
      //     calendarController.jumpToMonth(date: DateTime(2022, 8));
      //   },
      // ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(
                        LineIcons.arrowLeft,
                        size: 20,
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    'Choose dates',
                    style: TextStyle(fontWeight: FontWeight.w200),
                  )
                ],
              ),
            ),
            const Divider(
              thickness: 1,
            ),
            Expanded(
              child: ScrollableCleanCalendar(
                calendarController: calendarController,
                layout: Layout.BEAUTY,
                calendarCrossAxisSpacing: 0,
                calendarMainAxisSpacing: 1.5,
                spaceBetweenMonthAndCalendar: 16,
                spaceBetweenCalendars: 16,
                dayDisableBackgroundColor: orange,
                daySelectedBackgroundColor: yellow,
                daySelectedBackgroundColorBetween: yellow.withOpacity(.2),
                weekdayTextStyle: TextStyle(
                    fontWeight: FontWeight.w300, color: Colors.black38),
                monthTextStyle: TextStyle(fontWeight: FontWeight.w400),
              ),
            ),
            const Divider(
              thickness: 1,
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 30, right: 30),
              child: MyElevatedButton(
                  onPressed: () {
                    // check if two dates are selected
                    //and only then allow them to move to next page
                    Navigator.of(context, rootNavigator: true).push(
                        MaterialPageRoute(
                            builder: (context) => GuestsPickPage()));
                  },
                  width: double.infinity,
                  borderRadius: BorderRadius.circular(10),
                  child: Text(
                    'Next',
                    textScaleFactor: 1.2,
                    style: TextStyle(fontWeight: FontWeight.w300),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
