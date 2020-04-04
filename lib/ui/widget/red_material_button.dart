import 'package:flutter/material.dart';

class RedMaterialButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const RedMaterialButton({Key key, this.title, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MaterialButton(
        padding: const EdgeInsets.symmetric(horizontal: 65.0, vertical: 10.0),
        onPressed: onPressed,
        color: Color(0xFFFF473D),
        splashColor: Colors.redAccent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Text(
          title,
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ),
    );
  }
}
