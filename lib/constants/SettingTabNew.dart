import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:guido/constants/colors.dart';

class SettingTabZ extends StatefulWidget {
  final Icon icon;
  final Text setting;
  final Widget nextpage;
  const SettingTabZ(
      {super.key,
      required this.icon,
      required this.setting,
      required this.nextpage});

  @override
  State<SettingTabZ> createState() => _SettingTabZState();
}

class _SettingTabZState extends State<SettingTabZ> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context, rootNavigator: true)
            .push(MaterialPageRoute(builder: (context) => widget.nextpage));
      },
      child: AbsorbPointer(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      widget.icon,
                      SizedBox(
                        width: 5,
                      ),
                      widget.setting,
                    ],
                  ),
                  const Divider(
                    height: 2,
                    thickness: 1,
                    indent: 25,
                  ),
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.keyboard_arrow_right,
                size: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class LogoutButton extends StatefulWidget {
  final Icon icon;
  final Text setting;
  final Widget nextpage;
  const LogoutButton(
      {super.key,
      required this.icon,
      required this.setting,
      required this.nextpage});

  @override
  State<LogoutButton> createState() => _LogoutButtonState();
}

class _LogoutButtonState extends State<LogoutButton> {
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
           _auth.signOut();
        print(_auth.currentUser);
        });  
        Navigator.of(context, rootNavigator: true)
            .push(MaterialPageRoute(builder: (context) => widget.nextpage));
      },
      child: AbsorbPointer(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      widget.icon,
                      SizedBox(
                        width: 5,
                      ),
                      widget.setting,
                    ],
                  ),
                  const Divider(
                    height: 2,
                    thickness: 1,
                    indent: 25,
                  ),
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.keyboard_arrow_right,
                size: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}
