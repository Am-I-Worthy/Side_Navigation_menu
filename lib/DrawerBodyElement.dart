import 'package:flutter/material.dart';

class DrawerBodyElement extends StatelessWidget {

  final IconData icon;
  final String text;
  final Function onPressed;
  final bool active;

  const DrawerBodyElement({
    Key key,
    this.icon,
    this.text,
    this.onPressed,
    this.active
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
          child: InkWell(
        onTap: (){
          onPressed(text);
        },
            child: Container(
          margin: EdgeInsets.all(13.0),
          height: 30.0,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: Icon(
                  icon,
                  color: (active)?Colors.lightBlue:Colors.black87,
                ),
              ),
              SizedBox(
                width: 15.0,
              ),
              Text(
                text,
                style: TextStyle(
                  fontSize: 16.0,
                  color: (active)?Colors.lightBlue:Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}