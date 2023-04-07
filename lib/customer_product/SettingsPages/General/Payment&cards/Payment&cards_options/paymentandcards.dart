import 'package:flutter/material.dart';
import 'package:guido/constants/colors.dart';

class PaymentandRefundsPage extends StatefulWidget {
  final String id = '/payment_cards';
  const PaymentandRefundsPage({super.key});

  @override
  State<PaymentandRefundsPage> createState() => _PaymentandRefundsPageState();
}

class _PaymentandRefundsPageState extends State<PaymentandRefundsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pink,
    );
  }
}
