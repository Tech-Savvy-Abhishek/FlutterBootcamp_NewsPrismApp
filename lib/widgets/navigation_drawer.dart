import 'package:flutter/material.dart';
import 'package:news_prism/data/drawer_items.dart';
import 'package:news_prism/model/drawer_item.dart';
import 'package:news_prism/pages/profile.dart';
import 'package:news_prism/pages/readlater.dart';
import 'package:news_prism/pages/settings.dart';
import 'package:news_prism/pages/subscriptions.dart';
import 'package:news_prism/provider/nav_provider.dart';
import 'package:provider/provider.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final safeArea =
        EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top);

    final provider = Provider.of<NavigationProvider>(context);
    final isCollapsed = provider.isCollapsed;

    return Container(
      width: isCollapsed ? MediaQuery.of(context).size.width * 0.2 : null,
      child: Drawer(
        child: Container(
          color: Color(0xFFFBF1D3),
          child: Column(
            children: [
              Container(
                color: Color(0xFF0A2647),
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 24).add(safeArea),
                //heading in the nav drawer
                child: buildHeader(isCollapsed),
              ),
              buildList(items: itemsFirst, isCollapsed: isCollapsed),
              const SizedBox(height: 40),
              Divider(
                color: Color(0xFF0A2647),
                thickness: 1.5,
                indent: 25,
                endIndent: 25,
              ),
              const SizedBox(height: 40),
              buildList(
                indexOffset: itemsFirst.length,
                items: itemsSecond,
                isCollapsed: isCollapsed,
              ),
              Spacer(),
              buildCollapseIcon(context, isCollapsed),
              const SizedBox(height:35),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildHeader(bool isCollapsed) {
    return isCollapsed
        ? Text(
            " N P",
            style: TextStyle(
              fontFamily: 'PlayfairDisplay',
              color: Color(0xFFFBF1D3),
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          )
        : Row(
            children: [
              const SizedBox(width: 24),

              const SizedBox(width: 16),
              Text(
                "NEWS PRISM",
                style: TextStyle(
                  fontFamily: 'PlayfairDisplay',
                  color: Color(0xFFFBF1D3),
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          );
  }

  buildCollapseIcon(BuildContext context, bool isCollapsed) {
    final double size = 52;
    final icon = isCollapsed
        ? Icons.arrow_forward_ios_outlined
        : Icons.arrow_back_ios_outlined;
    final alignment = isCollapsed ? Alignment.center : Alignment.centerRight;
    final margin = isCollapsed ? null : EdgeInsets.only(right: 16);
    final width = isCollapsed ? double.infinity : size;
    return Container(
      alignment: alignment,
      margin: margin,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            final provider =
                Provider.of<NavigationProvider>(context, listen: false);
            provider.toggleIsCollapsed();
          },
          child: Container(
            width: width,
            height: size,
            child: Icon(
              icon,
              color: Colors.grey[800],
              size: 33,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildList(
          {required List<DrawerItem> items,
          required bool isCollapsed,
          int indexOffset = 0}) =>
      ListView.separated(
          padding: isCollapsed
              ? EdgeInsets.symmetric(horizontal: 10, vertical: 40)
              : EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          shrinkWrap: true,
          primary: false,
          itemCount: items.length,
          separatorBuilder: (context, index) => SizedBox(height: 16),
          itemBuilder: (context, index) {
            final item = items[index];
            return buildMenuItem(
                isCollapsed: isCollapsed,
                text: item.title,
                icon: item.icon,
                onClicked: () {
                  return selectItem(context, indexOffset + index);
                });
          });

  buildMenuItem(
      {required bool isCollapsed,
      required String text,
      required IconData icon,
      VoidCallback? onClicked}) {
    final color = Colors.grey[800];
    final leading = Icon(
      icon,
      color: color,
      size: 30,
    );
    return Material(
      color: Colors.transparent,
      child: isCollapsed
          ? ListTile(
              leading: leading,
              onTap: onClicked,
            )
          : ListTile(
              leading: leading,
              title: Text(text,
                  style: TextStyle(
                    color: color,
                    fontSize: 20,
                    fontFamily: 'FaunaOne',
                    fontWeight: FontWeight.w600,
                  )),
              onTap: onClicked,
            ),
    );
  }

  void selectItem(BuildContext context, int index) {
    final navigateTo = (page) => Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => page));

    Navigator.of(context).pop();
    switch(index)
    {
      case 0:
        navigateTo(Profile());
        break;
      case 1:
        navigateTo(Subscriptions());
        break;
      case 2:
        navigateTo(ReadLater());
        break;
      case 3:
        navigateTo(Settings());
        break;
    }
  }
}
