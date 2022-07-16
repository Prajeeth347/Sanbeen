import 'package:flutter/material.dart';
import 'package:sanbeen_zedital/drawers/main_drawer.dart';
import 'package:sanbeen_zedital/screens/faqpage.dart';
import 'package:sanbeen_zedital/screens/mainpage.dart';
import 'package:sanbeen_zedital/screens/recentactivity.dart';
import 'package:sanbeen_zedital/screens/shortlistedproperties.dart';

class mainnavbar extends StatefulWidget {
  const mainnavbar({Key? key}) : super(key: key);

  @override
  State<mainnavbar> createState() => _mainnavbarState();
}

class _mainnavbarState extends State<mainnavbar> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      drawer: main_drawer(
        user_image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjjYXm0bKrsV1VZPuyaq-j009UD1aBDCUz5A&usqp=CAU",
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Shortlisted'),
          BottomNavigationBarItem(
              icon: Icon(Icons.history_rounded), label: 'Activity'),
          BottomNavigationBarItem(
              icon: Icon(Icons.support_agent_rounded), label: 'Services'),
        ],
        selectedItemColor: Theme.of(context).hintColor,
        unselectedItemColor: Theme.of(context).primaryColor,
        backgroundColor: Theme.of(context).backgroundColor,
        currentIndex: selectedIndex,
        onTap: _ontapped,
      ),
      body: selectindex(),
    );
  }

  void _ontapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  selectindex() {
    if (selectedIndex == 0) {
      return main_page();
    } else if (selectedIndex == 1) {
      return short_properties();
    } else if (selectedIndex == 2) {
      return recent_activity();
    } else {
      return faqpage();
    }
  }
}
