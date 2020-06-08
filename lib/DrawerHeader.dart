import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class DrawerHeaderCus extends StatelessWidget {
  const DrawerHeaderCus({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: AnimationLimiter(
          child: Column(
            children: AnimationConfiguration.toStaggeredList(
              duration: const Duration(milliseconds: 375),
              childAnimationBuilder: (widget) => SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(
                  child: widget,
                ),
              ),
              children: [
        Container(
          margin: EdgeInsets.only(top: 35.0),
          width: MediaQuery.of(context).size.width / 3.8,
          height: MediaQuery.of(context).size.width / 3.8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.0),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/2.jpg'),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            'Scarlett Johnson',
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Text(
          'Edit Profile',
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20.0, bottom: 10.0),
          height: 0.5,
          width: double.infinity,
          color: Colors.lightBlueAccent,
        ),
      ],
            ),
          ),
        ),
      );
  }
}