import 'package:flutter/material.dart';
import 'package:guido/constants/colors.dart';

class PaymentMethodsPage extends StatefulWidget {
    final String id = '/payment_methods';
  const PaymentMethodsPage({super.key});

  @override
  State<PaymentMethodsPage> createState() => _PaymentMethodsPageState();
}

class _PaymentMethodsPageState extends State<PaymentMethodsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
    );
  }
}