import 'package:flutter/material.dart';
import 'package:guido/constants/colors.dart';
import 'package:guido/constants/icons.dart';

class AccountsandPrivacyPage extends StatefulWidget {
    final String id = '/accountsandprivacy';

   const AccountsandPrivacyPage({super.key});

  @override
  State<AccountsandPrivacyPage> createState() => _AccountsandPrivacyPageState();
}

class _AccountsandPrivacyPageState extends State<AccountsandPrivacyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(child: Column(children: [
           GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Icon(
                      Icons.arrow_back,
                      size: 15,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 24.0, top: 24),
                  child: Text(
                    'Accounts & Privacy ',
                    style: TextStyle(fontWeight: FontWeight.w100, fontSize: 25),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   const Text('Accounts',style: TextStyle(fontWeight: FontWeight.w500),),
                   Padding(
                     padding:  EdgeInsets.all(8.0),
                     child: IconShader(icon: Icon(Icons.security_outlined,color: white,)),
                   ),
                   const Text('Make your account more secure '),
                   const Padding(
                     padding:  EdgeInsets.only(top:8.0),
                     child: Text('Current account secure level : High ',textScaleFactor: 0.7,),
                   ),
                   const Padding(
                     padding:  EdgeInsets.only(top:8.0),
                     child: Text('At Guido, we take your security seriously. To protect your Account, we strongly recommend verify your deatils',textScaleFactor: 0.7,),
                   ),
                   // its here
                   SizedBox(height: MediaQuery.of(context).size.height*0.04,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                        const Text(
                          'Phone Number',
                          style: TextStyle(fontWeight: FontWeight.w500,color: Colors.black),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Verified',
                              style: TextStyle(fontWeight: FontWeight.w300),
                              textScaleFactor: 0.8,
                            ),
                            TextButton(
                                onPressed: () {},
                                child: const IconShader(icon: Icon(Icons.check_circle_outline,color: Colors.white,))
                            )
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                        const Text(
                          'Email ',
                          style: TextStyle(fontWeight: FontWeight.w500,color: Colors.black),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Verified',
                              style: TextStyle(fontWeight: FontWeight.w300),
                              textScaleFactor: 0.8,
                            ),
                            TextButton(
                                onPressed: () {},
                                child: const IconShader(icon: Icon(Icons.check_circle_outline,color: Colors.white,))
                            )
                          ],
                        ),
                      ],
                    ),
                ],
              ),
            ),// accounts
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding:  EdgeInsets.only(bottom:20.0),
                    child:  Text('Social Accounts',style: TextStyle(fontWeight: FontWeight.w500),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:8.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  [
                          const Text(
                            'Google ',
                            style: TextStyle(fontWeight: FontWeight.w500,color: Colors.black),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                               const Text(
                                'Connected',
                                style: TextStyle(fontWeight: FontWeight.w300),
                                textScaleFactor: 0.7,
                              ),
                              TextButton(
                                 onPressed: () {},
                                  child:  IconShader(icon: Icon(Icons.check_circle_outline,color: Colors.white,))
                              )
                            ],
                          ),
                        ],
                      ),
                  ),
                    Padding(
                      padding: const EdgeInsets.only(top:8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  [
                          const Text(
                            'Instagram ',
                            style: TextStyle(fontWeight: FontWeight.w500,color: Colors.black),
                          ),
                          
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Not Connected',
                                style: TextStyle(fontWeight: FontWeight.w300),
                                textScaleFactor: 0.7,
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: const IconShader(icon: Icon(Icons.connect_without_contact,color: Colors.white,size: 15,))
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Divider(thickness: 1,height: 36,),
                ],
              ),
            ),
            //socials connected
            Padding(
              padding: const EdgeInsets.only(left: 24,right: 24,bottom: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Deactivate your accounts',textScaleFactor: 0.7,),
                  TextButton(
                        onPressed: () {},
                        child: Text('Deactivate',style: TextStyle(color: Colors.red),textScaleFactor: 0.7,)
                    ),
                ],
              ),
            ),
      ],
      ),
      ),
    );
  }
}
