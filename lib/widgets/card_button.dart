import 'package:flutter/material.dart';
import 'package:untitled/constants/constants.dart';

class CardButton extends StatelessWidget {
  const CardButton(
      {super.key, required this.onTap, required this.city, required this.temp});
  final VoidCallback onTap;
  final String city;
  final String temp;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPaddingMedium),
      child: SizedBox(
        child: GestureDetector(
          onTap: onTap,
          child: Card(
              color: Colors.white60,
              elevation: 3,
              child: SizedBox(
                width: 200,
                height: 70,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        city,
                        style: kTextStyle,
                      ),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
