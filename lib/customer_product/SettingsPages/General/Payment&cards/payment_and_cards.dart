import 'package:flutter/material.dart';
import 'package:guido/constants/Space_Cards.dart';
import 'package:guido/constants/colors.dart';
import 'package:guido/constants/icons.dart';
import 'package:guido/customer_product/SettingsPages/General/Payment&cards/Payment&cards_options/creditsandcoupons.dart';
import 'package:guido/customer_product/SettingsPages/General/Payment&cards/Payment&cards_options/paymentandcards.dart';
import 'package:guido/customer_product/SettingsPages/General/Payment&cards/Payment&cards_options/paymenthistory.dart';
import 'package:guido/customer_product/SettingsPages/General/Payment&cards/Payment&cards_options/paymentmethods.dart';

class PaymentandCardsPage extends StatefulWidget {

   final String id = '/paymentsandcards';

   const PaymentandCardsPage({super.key});

  @override
  State<PaymentandCardsPage> createState() => _PaymentandCardsPageState();
}

class _PaymentandCardsPageState extends State<PaymentandCardsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(child: 
      Column(children: [
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
                    'Payments & Cards',
                    style: TextStyle(fontWeight: FontWeight.w100, fontSize: 25),
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.05,),
            Expanded(child: 
            ListView(
              children: const [
                SpaceCard(icon:  IconShader(icon: Icon(Icons.money_outlined,color: Colors.white,),),
                 setting:  Text('Payment Methods'), 
                 next: PaymentMethodsPage(), 
                 ),
                 SpaceCard(icon:  IconShader(icon: Icon(Icons.currency_pound_outlined,color: Colors.white,),),
                 setting:  Text('Credits & Coupons'), 
                 next: CreditsandCouponsPage(), 
                 ),
                 SpaceCard(icon:  IconShader(icon: Icon(Icons.backpack_outlined,color: Colors.white,),),
                 setting:  Text('Payments & Refunds'), 
                 next: PaymentandRefundsPage(), 
                 ),
                 SpaceCard(icon:  IconShader(icon: Icon(Icons.history_edu_outlined,color: Colors.white,),),
                 setting:  Text('Payment History'), 
                 next: PaymentHistoryPage(), 
                 ),
              ],
            ))
      ],)),
    );
  }
}