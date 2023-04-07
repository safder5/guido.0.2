import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:fluttericon/linecons_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:guido/client_product/constants%20/button.dart';
import 'package:guido/constants/GuidoeventContainer.dart';
import 'package:guido/constants/buttons.dart';
import 'package:guido/constants/colors.dart';
import 'package:guido/constants/icons.dart';

class PartActiveBooking extends StatefulWidget {
  const PartActiveBooking({super.key});

  @override
  State<PartActiveBooking> createState() => _PartActiveBookingState();
}

class _PartActiveBookingState extends State<PartActiveBooking> {
  final _auth = FirebaseAuth.instance;
  String uid = '';

  getUserID() async {
    final user = _auth.currentUser;
    try {
      if (user != null) {
        uid = user.email!;
      }
    } catch (e) {
      print(e);
    }
  }

  int _index = 0;

  @override
  void initState() {
    super.initState();
    getUserID();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(top: 0, right: 16, bottom: 16, left: 16),
      child: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.115,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black26, width: 0.5),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                SizedBox(
                  width: width * 0.28,
                  height: MediaQuery.of(context).size.height,
                  child: const ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10)),
                    child: Image(
                      image: AssetImage('lib/images/templeGuido.png'),
                      // width: width,
                      // height: height * 0.81,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          width: width * 0.55,
                          child: Text(
                            'Festival of Matho and culture feel it deeply',
                            style: GoogleFonts.libreBaskerville(
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.w500)),
                            textScaleFactor: 0.9,
                            overflow: TextOverflow.ellipsis,
                          )),
                      const SizedBox(
                        height: 7,
                      ),
                      Text(
                        'Booked on 30 Jan 2023',
                        textScaleFactor: 0.7,
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            color: black.withOpacity(0.5)),
                      ),
                      const Spacer(),
                      Text(
                        'Host by Safder',
                        textScaleFactor: 0.7,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: black.withOpacity(0.78)),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            children: [
              CustomStep(
                abovetick: Colors.transparent,
                belowtick: black.withOpacity(0.45),
                active: false,
                day: 1,
              ),
              CustomStep(
                abovetick: Colors.black.withOpacity(0.45),
                belowtick: black,
                active: false,
                day: 2,
              ),
              CustomStep(
                abovetick: black,
                belowtick: trans,
                active: true,
                day: 3,
              )
            ],
          ),
          Row(
            children: [
              const SizedBox(
                width: 50,
              ),
              daysContainers(
                  text: 'Local chai',
                  text2: 'in morning',
                  icon: Icon(
                    LineariconsFree.coffee_cup,
                    size: 12,
                    color: white,
                  )),
              daysContainers(
                  text: 'Forest Outing',
                  text2: 'morning walk',
                  icon: Icon(
                    FontAwesome5.tree,
                    size: 12,
                    color: white,
                  )),
              daysContainers(
                  text: 'BreakFast',
                  text2: 'traditional bf',
                  icon: Icon(
                    FontAwesome5.pizza_slice,
                    size: 12,
                    color: white,
                  )),
            ],
          ),
          const SizedBox(
            height: 32,
          ),
          GuidoEventContainerTwo(uid: uid),
          const SizedBox(
            height: 32,
          ),
          const Text(
            'What next?',
            textScaleFactor: 1.2,
            style: TextStyle(fontWeight: FontWeight.w200),
          ),
          const SizedBox(
            height: 24,
          ),
          const CallmeDirectionContainerBookingPage(),
          const SizedBox(
            height: 32,
          ),
          const PaymentSummaryBookingsPage(),
          // BorderGradientButton(onPressed: (){}, child: Text('d'))
        ],
      ),
    );
  }
}

class CustomStep extends StatefulWidget {
  final Color abovetick;
  final Color belowtick;
  final bool active;
  final int day;
  const CustomStep(
      {super.key,
      required this.abovetick,
      required this.belowtick,
      required this.active,
      required this.day});

  @override
  State<CustomStep> createState() => _CustomStepState();
}

class _CustomStepState extends State<CustomStep> {
  @override
  Widget build(BuildContext context) {
    double h = 120;
    return Container(
      height: h,
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 36,
                // margin: const EdgeInsets.only(left: 20),
                // padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
                decoration: BoxDecoration(
                    border: Border(
                        left: BorderSide(
                  color: widget.abovetick,
                ))),
              ),
              widget.active
                  ? Container(
                      height: 24,
                      width: 24,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black)),
                    )
                  : Container(
                      height: 24,
                      width: 24,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black)),
                      child: Center(
                          child: Icon(
                        Icons.check,
                        size: 16,
                        color: white,
                      )),
                    ),
              Container(
                height: 60,
                decoration: BoxDecoration(
                    border: Border(
                        left: BorderSide(
                  color: widget.belowtick,
                ))),
              ),
            ],
          ),
          const SizedBox(
            width: 25,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Day ${widget.day}',
                    textScaleFactor: 1.1,
                    style: const TextStyle(fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Visibility(
                    visible: widget.active,
                    child:  Container(
                      decoration: BoxDecoration(
                          border: GradientBoxBorder(
                              width: 0.5,
                              gradient:
                                  LinearGradient(colors: [orange, yellow])),
                          borderRadius: BorderRadius.circular(2.5)),
                      child: const Padding(
                        padding:  EdgeInsets.all(3),
                        child:  TextShader(Text(
                          'Today',
                          style: TextStyle(
                              fontSize: 8,
                              fontWeight: FontWeight.w200,
                              color: Colors.white),
                        )),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: const Text(
                    'Firstly we offer you local chai which to much taste, then we go to forest for some morning views , then we offer you tranditional cuisine in breakfast......more',
                    style: TextStyle(fontWeight: FontWeight.w300),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    textScaleFactor: 0.8,
                  )),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.calendar_today,
                    size: 10,
                  ),
                  const Text(
                    '  Fri, 3 Mar 2023   ',
                    style: TextStyle(fontWeight: FontWeight.w300, fontSize: 10),
                  ),
                  Icon(
                    widget.active ? Entypo.up_open_big : Entypo.down_open_big,
                    size: 10,
                  )
                ],
              ),

              // Visibility(
              //   visible: widget.active,
              //   child: SizedBox(
              //   width: MediaQuery.of(context).size.width*0.7,
              //   height: 50,
              //   child: Row(children: [
              //     Container(width: 10,height: 50,color: black,),
              //     Container(width: 10,height: 50,color: black,),
              //     Container(width: 10,height: 50,color: black,),
              //   ],),
              // ))
            ],
          )
        ],
      ),
    );
  }
}

class daysContainers extends StatelessWidget {
  final String text;
  final Icon icon;
  final String text2;
  const daysContainers(
      {super.key, required this.text, required this.icon, required this.text2});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      width: MediaQuery.of(context).size.width * 0.235,
      decoration: BoxDecoration(
          border: GradientBoxBorder(
            gradient: LinearGradient(colors: [orange, yellow]),
            width: 0.35,
          ),
          borderRadius: BorderRadius.circular(6)),
      child: Padding(
        padding:
            const EdgeInsets.only(right: 6.0, left: 6.0, top: 14, bottom: 14),
        child: Row(
          children: [
            IconShader(icon: icon),
            const SizedBox(
              width: 5,
            ),
            Container(
              width: 60,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    textScaleFactor: 0.8,
                    style: const TextStyle(fontWeight: FontWeight.w300),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    text2,
                    textScaleFactor: 0.6,
                    style: const TextStyle(fontWeight: FontWeight.w300),
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CallmeDirectionContainerBookingPage extends StatelessWidget {
  const CallmeDirectionContainerBookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 310,
      child: Stack(
        children: [
          Container(
            height: 280,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              border: GradientBoxBorder(
                  width: 0.7,
                  gradient: LinearGradient(colors: [orange, yellow])),
              borderRadius: BorderRadius.circular(10),
              // color: white
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // add here
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: black.withOpacity(0.2),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text(
                                'Hey! I’m Safder',
                                textScaleFactor: 1,
                                style: TextStyle(fontWeight: FontWeight.w300),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              IconShader(
                                  icon: Icon(
                                Icons.security,
                                color: white,
                                size: 16,
                              )),
                            ],
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          const Text('Now your Guido host',
                              textScaleFactor: 0.6,
                              style: TextStyle(fontWeight: FontWeight.w300))
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text('Now what to do?',
                      textScaleFactor: 0.75,
                      style: TextStyle(fontWeight: FontWeight.w500)),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    'Now you have to pack your bag and leave for tamil nadu and when you reach to tamil nadu take a cab to my pace location and phone number is already provided feel free to contact anytime I’m there help you....more',
                    textScaleFactor: 0.7,
                    style: TextStyle(fontWeight: FontWeight.w200),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text('Address',
                      textScaleFactor: 0.75,
                      style: TextStyle(fontWeight: FontWeight.w500)),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    'Ranganatha, located in Srirangam, Tiruchirapalli, Tamil Nadu, India.',
                    textScaleFactor: 0.7,
                    style: TextStyle(fontWeight: FontWeight.w200),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text('Arriving  date & time',
                      textScaleFactor: 0.75,
                      style: TextStyle(fontWeight: FontWeight.w500)),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    'Thu, 3 mar 2023 Evening ',
                    textScaleFactor: 0.7,
                    style: TextStyle(fontWeight: FontWeight.w200),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              bottom: 5,
              left: 20,
              child: BorderGradientButtonTwo(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16),
                    child: Row(
                      children: [
                        IconShader(
                            icon: Icon(
                          LineariconsFree.phone_handset,
                          size: 16,
                          color: white,
                        )),
                        const SizedBox(
                          width: 5,
                        ),
                        TextShader(Text(
                          'Call Me',
                          style: TextStyle(
                              color: white, fontWeight: FontWeight.w200),
                          textScaleFactor: 1.2,
                        )),
                      ],
                    ),
                  ))),
          const Spacer(),
          Positioned(
              bottom: 5,
              right: 20,
              child: BorderGradientButtonTwo(
                  color: white,
                  borderRadius: BorderRadius.circular(10),
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 12),
                    child: Row(
                      children: [
                        IconShader(
                            icon: Icon(
                          Linecons.location,
                          size: 16,
                          color: white,
                        )),
                        const SizedBox(
                          width: 5,
                        ),
                        TextShader(Text(
                          'Directions',
                          style: TextStyle(
                              color: white, fontWeight: FontWeight.w200),
                          textScaleFactor: 1.2,
                        )),
                      ],
                    ),
                  )))
        ],
      ),
    );
  }
}

class PaymentSummaryBookingsPage extends StatelessWidget {
  const PaymentSummaryBookingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Payment Summary',
            textScaleFactor: 1.2,
            style: TextStyle(fontWeight: FontWeight.w200),
          ),
          const SizedBox(
            height: 32,
          ),
          Row(
            children: [
              const Text(
                'Charges for 4 days x 1 Guest',
                style: TextStyle(fontWeight: FontWeight.w200),
              ),
              const Spacer(),
              const Text(
                '\$ 50',
                style: TextStyle(fontWeight: FontWeight.w200),
              ),
            ],
          ),
          const Divider(
            height: 30,
          ),
          Row(
            children: [
              const Text(
                'Price drop . 29%',
                style: TextStyle(fontWeight: FontWeight.w200),
              ),
              const Spacer(),
              const Text(
                '\$ 14.5',
                style: TextStyle(fontWeight: FontWeight.w200),
              ),
            ],
          ),
          const Divider(
            height: 30,
          ),
          Row(
            children: [
              const Text(
                'GUIDONEW50 coupon applied',
                style: TextStyle(fontWeight: FontWeight.w200),
              ),
              const Spacer(),
              const Text(
                '-\$ 5',
                style: TextStyle(
                    fontWeight: FontWeight.w200, color: Color(0xFF1DB95B)),
              ),
            ],
          ),
          const Divider(
            height: 30,
          ),
          Row(
            children: [
              const Text(
                'Total amont you paid',
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
              const Spacer(),
              const Text(
                '\$ 30',
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
            ],
          ),
          const SizedBox(
            height: 32,
          ),
          BorderGradientButton(
              borderRadius: BorderRadius.circular(10),
              width: MediaQuery.of(context).size.width,
              onPressed: () {},
              child: const TextShader(Text(
                'Download Invoice',
                textScaleFactor: 1.2,
                style: TextStyle(fontWeight: FontWeight.w200),
              ))),
              const SizedBox(
            height: 32,
          ),
          const Text(
            'Cancellation',
            textScaleFactor: 1.2,
            style: TextStyle(fontWeight: FontWeight.w200),
          ),
          const SizedBox(
            height: 24,
          ),
          const Text(
            'We suggest you to not cancel, this can be one of the best experience of your life. ',
            textScaleFactor: 0.8,
            style: TextStyle(fontWeight: FontWeight.w200),
          ),
          const SizedBox(
            height: 24,
          ),
          Row(
            children: [
              CircleAvatar(backgroundColor: black.withOpacity(0.05),radius: 12,child: Icon(Linecons.tag,size: 16,color: black.withOpacity(0.5),)),
              const SizedBox(width: 10,),
              Container(
                width: MediaQuery.of(context).size.width/2,
                child: const Text('Free cancellation was available till 31 Jan 2023, 9:00 am.',textScaleFactor: 0.8,style: TextStyle(fontWeight: FontWeight.w200),),
              )
            ],
          ),
          const SizedBox(height: 16,),
          Row(
            children: [
              CircleAvatar(backgroundColor: black.withOpacity(0.05),radius: 12,child: Icon(LineariconsFree.lock_1,size: 16,color: black.withOpacity(0.5),),),
              const SizedBox(width: 10,),
              Container(
                width: MediaQuery.of(context).size.width/2,
                child: const Text('Amount paid will be refunded back to source & no coupon will refunded',textScaleFactor: 0.8,style: TextStyle(fontWeight: FontWeight.w200),),
              )
            ],
          ),
          const SizedBox(
            height: 32,
          ),
          BorderGradientButton(
              borderRadius: BorderRadius.circular(10),
              width: MediaQuery.of(context).size.width,
              onPressed: () {},
              child: const TextShader(Text(
                'Cancel Booking',
                textScaleFactor: 1.2,
                style: TextStyle(fontWeight: FontWeight.w200),
              ))),
              const SizedBox(
            height: 32,
          ),
        ],
      ),
    );
  }
}
// class CustomStepper extends StatelessWidget {
//   const CustomStepper({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           children: [
//             Container(
//               margin: const EdgeInsets.only(left: 8, right: 5),
//               height: 24,
//               width: 24,
//               decoration: BoxDecoration(
//                   color: Colors.black,
//                   shape: BoxShape.circle,
//                   border: Border.all(color: Colors.black)),
//               child: Center(
//                   child: Icon(
//                 Icons.check,
//                 size: 16,
//                 color: white,
//               )),
//             ),
//             SizedBox(
//               width: 10,
//             ),
//             const Text("Day 1", style: TextStyle(fontWeight: FontWeight.w300)),
//           ],
//         ),
//         Container(
//           margin: const EdgeInsets.only(left: 20),
//           padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
//           decoration: const BoxDecoration(
//               border: Border(
//                   left: BorderSide(
//             color: Colors.black,
//           ))),
//           child: const Text('SubTitle\nAbc'),
//         ),
//       ],
//     );
//   }
// }