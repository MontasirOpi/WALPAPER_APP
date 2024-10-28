import 'package:flutter/material.dart';
import 'package:walpaper_app/pages/accunts_page.dart';
import 'package:walpaper_app/pages/explore_page.dart';
import 'package:walpaper_app/pages/home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool _isVisible=true;
  int _currentIndex = 0;
  List<Widget> _pages = [];
  @override
  void initState() {
    super.initState();
    _pages = [
       HomePage(afterScrollResult: afterScrollResult,),
      const ExplorePage(),
      const AccuntsPage(),
    ];
  }
  afterScrollResult(bool visiblity){
    setState(() {
      _isVisible=visiblity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: _isVisible ?100:0,
        child: Wrap(
          children: [
            BottomNavigationBar(
            
              type: BottomNavigationBarType.fixed,
              fixedColor: Colors.black,
              unselectedItemColor: Colors.grey,
              iconSize: 32,
              currentIndex: _currentIndex,
              onTap: (index){
                setState(() {
                  _currentIndex=index;
                });
              },
              items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.card_giftcard), label: 'Explore'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_box_outlined), label: 'Account'),
            ]),
          ],
        ),
      ),
    );
  }
}
