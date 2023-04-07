import 'package:flutter/material.dart';
import 'package:guido/constants/colors.dart';

class PrivacyPolicyPage extends StatefulWidget {
 final String id = '/privacy_policy';
  const PrivacyPolicyPage({super.key});

  @override
  State<PrivacyPolicyPage> createState() => _PrivacyPolicyPageState();
}

class _PrivacyPolicyPageState extends State<PrivacyPolicyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: orange,
    );
  }
}
