import 'package:flutter/material.dart';
import 'package:guido/client_product/initial_pages_setup/clientpageone.dart';
import 'package:guido/constants/colors.dart';
import 'package:guido/customer_product/screens/afterinfopage.dart';

// bool guido = false;
// bool customer = false;
// String w = '';
// IdentifyUser() {
//   if (customer == true)
//     w = 'c';
//   else if (guido == true) w = 'g';
//   print(w);
// }

class SelectionPage extends StatefulWidget {
  const SelectionPage({super.key});

  @override
  State<SelectionPage> createState() => _SelectionPageState();
}

class _SelectionPageState extends State<SelectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('What do you want to Explore?'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        // customer = true;
                        // IdentifyUser();
                      });
                      Navigator.pushNamed(context, '/firstpage');
                      // print(customer);
                    },
                    child: Text('Travel')),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        // guido = true;
                        // IdentifyUser();
                      });
                      Navigator.pushNamed(context, '/client_page_one');
                      // print(guido);
                    },
                    child: Text('Be a Guido'))
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// class Routing extends StatelessWidget {
//   final String id = '/routing';
//   const Routing({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return (w == 'c') ? AfterInfoPage() : ClientPageOne();
//   }
// }
