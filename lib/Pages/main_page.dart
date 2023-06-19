import 'package:codepan/resources/dimensions.dart';
import 'package:codepan/widgets/elevated.dart';
import 'package:codepan/widgets/icon.dart';
import 'package:codepan/widgets/page_builder.dart';
import 'package:codepan/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:track/Pages/track_page.dart';
import 'package:track/colors.dart';
import 'package:codepan/widgets/page_builder.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.title});

  final String title;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    final d = Dimension.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: d.at(80),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Padding(
          padding: EdgeInsets.only(
            top: d.at(50),
            bottom: d.at(50),
            left: d.at(5),
            right: d.at(5),
          ),
          // Add padding around the colored container
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(d.at(10)),
              color: AppColors.grey100,
            ),
            child: Padding(
              padding: EdgeInsets.only(left: d.at(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child: Dropdown(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: d.at(20)),
                    child: PanIcon(
                      icon: 'chevron_down',
                      width: d.at(10),
                      height: d.at(10),
                      alignment: Alignment.center,
                      color: AppColors.grey300,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: d.at(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PanIcon(
                  icon: 'filter',
                  width: d.at(15),
                  height: d.at(15),
                  alignment: Alignment.center,
                  color: AppColors.blueFont,
                ),
                SizedBox(width: d.at(21)),
                // Add a SizedBox with desired width for spacing
                PanIcon(
                  icon: 'settings',
                  width: d.at(15),
                  height: d.at(15),
                  alignment: Alignment.center,
                  color: AppColors.blueFont,
                ),
              ],
            ),
          ),
        ],
      ),
      body: PageBuilder(
        behaviour: PageScrollBehaviour.none,
        builder: (context) {
          return IndexedStack(
            index: _index,
            children: const [
              TrackPage(),
              TrackPage(),
              TrackPage(),
              TrackPage(),
              TrackPage(),
            ],
          );
        },
        extendBody: false,
        bottomNavigationBar: SafeArea(
          child: SizedBox(
            height: d.at(60),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              showUnselectedLabels: true,
              currentIndex: _index,
              selectedLabelStyle: TextStyle(
                fontSize: d.at(9),
                color: AppColors.blueShadow,
                fontWeight: FontWeight.w600,
              ),
              unselectedLabelStyle: TextStyle(
                fontSize: d.at(9),
                color: AppColors.blueShadow,
                fontWeight: FontWeight.w600,
              ),
              onTap: (index) {
                setState(() {
                  _index = index;
                });
              },
              items: <BottomNavigationBarItem>[
                _TabBarItem(
                  context: context,
                  item: 'home',
                  width: d.at(36),
                  height: d.at(36),
                  text: 'Home',
                ),
                _TabBarItem(
                  context: context,
                  item: 'todo',
                  width: d.at(18),
                  height: d.at(18),
                  text: 'To-do',
                ),
                _TabBarItem(
                  context: context,
                  item: 'chart_line',
                  width: d.at(18),
                  height: d.at(18),
                  text: 'Track',
                ),
                _TabBarItem(
                  context: context,
                  item: 'user_multiple',
                  width: d.at(18),
                  height: d.at(18),
                  text: 'Engage',
                ),
                _TabBarItem(
                  context: context,
                  item: 'more',
                  width: d.at(15),
                  height: d.at(15),
                  text: 'More',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TabBarItem extends BottomNavigationBarItem {
  _TabBarItem({
    required BuildContext context,
    required String item,
    required double width,
    required double height,
    String? text,
  }) : super(
          icon: _TabItemContainer(
            child: PanIcon(
              icon: item,
              width: width,
              height: height,
              fit: BoxFit.fill,
              alignment: Alignment.bottomCenter,
              color: Theme.of(context).disabledColor,
            ),
          ),
          activeIcon: _TabItemContainer(
            child: PanIcon(
              fit: BoxFit.fill,
              icon: item,
              width: width,
              height: height,
              alignment: Alignment.bottomCenter,
              color: Theme.of(context).primaryColor,
            ),
          ),
          label: text,
        );
}

class _TabItemContainer extends StatelessWidget {
  final Widget child;

  const _TabItemContainer({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final d = Dimension.of(context);
    return Container(
      alignment: Alignment.bottomCenter,
      width: d.at(21),
      height: d.at(21),
      padding: EdgeInsets.only(
        bottom: d.at(3),
      ),
      child: child,
    );
  }
}
