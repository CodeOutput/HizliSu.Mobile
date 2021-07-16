import 'package:flutter/material.dart';
import 'package:hizli_su/pages/widgets/button_widget.dart';
import 'package:hizli_su/pages/widgets/whitebox_widget.dart';

class NotfoundWidget extends StatelessWidget {
  final String title;
  final String description;
  final String buttonText;
  final Function onPressed;

  NotfoundWidget(
      {this.title, this.description, this.buttonText, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: WhiteBoxWidget(
        child: Column(
          children: [
            Center(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: const Color(0xFF30374E)),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(color: const Color(0xFF30374E), fontSize: 18),
            ),
            // SizedBox(
            //   height: 30,
            // ),
            // ButtonWidget(
            //   text: buttonText,
            //   onPressed: onPressed,
            // )
          ],
        ),
      ),
    );
  }
}
