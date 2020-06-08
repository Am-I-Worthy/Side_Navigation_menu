import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'DrawerBodyElement.dart';

class DrawerBody extends StatefulWidget {
  const DrawerBody({
    Key key,
  }) : super(key: key);

  @override
  _DrawerBodyState createState() => _DrawerBodyState();
}

String active = 'Home';

class _DrawerBodyState extends State<DrawerBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: AnimationLimiter(
        child: Column(
          children: AnimationConfiguration.toStaggeredList(
            duration: const Duration(milliseconds: 375),
            childAnimationBuilder: (widget) => SlideAnimation(
              horizontalOffset: -50.0,
              verticalOffset: 20.0,
              child: FadeInAnimation(
                child: widget,
              ),
            ),
            children: [
              DrawerBodyElement(
                icon: Icons.home,
                text: 'Home',
                active: active == 'Home' ? true : false,
                onPressed: (value) {
                  setState(() {
                    active = value;
                  });
                },
              ),
              DrawerBodyElement(
                icon: Icons.account_balance_wallet,
                text: 'Wallet',
                active: active == 'Wallet' ? true : false,
                onPressed: (value) {
                  setState(() {
                    active = value;
                  });
                },
              ),
              DrawerBodyElement(
                icon: Icons.history,
                text: 'History',
                active: active == 'History' ? true : false,
                onPressed: (value) {
                  setState(() {
                    active = value;
                  });
                },
              ),
              DrawerBodyElement(
                icon: Icons.payment,
                text: 'Payment',
                active: active == 'Payment' ? true : false,
                onPressed: (value) {
                  setState(() {
                    active = value;
                  });
                },
              ),
              DrawerBodyElement(
                icon: Icons.settings,
                text: 'Settings',
                active: active == 'Settings' ? true : false,
                onPressed: (value) {
                  setState(() {
                    active = value;
                  });
                },
              ),
              DrawerBodyElement(
                icon: Icons.help_outline,
                text: 'Help',
                active: active == 'Help' ? true : false,
                onPressed: (value) {
                  setState(() {
                    active = value;
                  });
                },
              ),
              DrawerBodyElement(
                icon: Icons.share,
                text: 'Share',
                active: active == 'Share' ? true : false,
                onPressed: (value) {
                  setState(() {
                    active = value;
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
