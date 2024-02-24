import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/utils/breakpoints.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:portfolio/utils/custom_colors.dart';
import 'package:portfolio/utils/image_asset_constants.dart';
import 'package:portfolio/widgets/logo.dart';
import 'package:portfolio/widgets/nav_bar_button.dart';
import 'package:portfolio/widgets/nav_bar_item.dart';
import 'package:portfolio/widgets/nav_bar_item_with_icon.dart';
import 'package:url_launcher/url_launcher.dart';

class NavBar extends StatelessWidget {
  final double width;
  final GlobalKey intrestsKey;
  final GlobalKey skillsKey;
  final ScrollController scrollController;
  late final RxDouble collapsableHeight;
  NavBar(
      {required this.width,
      required this.intrestsKey,
      required this.skillsKey,
      required this.scrollController,
      Key? key})
      : super(key: key) {
    collapsableHeight = 0.0.obs;
  }

  void scrollToWidgetByKey(GlobalKey key) {
    RenderBox box = key.currentContext?.findRenderObject() as RenderBox;
    Offset position = box.localToGlobal(Offset.zero); //this is global position
    double y = position.dy;
    scrollController.animateTo(y,
        duration: const Duration(milliseconds: 700), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    Widget navBarRow = Stack(children: [
      Padding(
        padding: const EdgeInsets.only(left: 40.0),
        child: Text(
          name,
          style: const TextStyle(
              color: CustomColors.primary,
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontFamily: 'Montserrat'),
        ),
      ),
      Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NavBarItem(
              text: 'Home',
              onTap: () {},
            ),
            NavBarItem(
                text: 'Skills', onTap: () => scrollToWidgetByKey(skillsKey)),
            NavBarItem(
              text: 'Interests',
              onTap: () => scrollToWidgetByKey(skillsKey),
            ),
            const SizedBox(width: 60),
          ]),
      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        const SizedBox(width: 50),
        Row(children: [
          NavBarItemWithIcon(
            text: 'Github',
            icon: ImageAssetConstants.github,
            url: github,
          ),
          const SizedBox(width: 10),
          NavBarItemWithIcon(
              text: 'Facebook',
              icon: ImageAssetConstants.facebook,
              url: facebook),
          const SizedBox(width: 10),
          NavBarItemWithIcon(
              text: 'LinkedIn',
              icon: ImageAssetConstants.linkedIn,
              url: linkedIn),
          const SizedBox(width: 50),
        ])
      ])
    ]);
    List<Widget>? navBarColumn = [
      NavBarItem(
          text: 'Home',
          onTap: () {
            collapsableHeight.value = 0.0;
          }),
      const SizedBox(width: 10),
      NavBarItem(
          text: 'Skills',
          onTap: () {
            scrollToWidgetByKey(skillsKey);

            collapsableHeight.value = 0.0;
          }),
      const SizedBox(width: 10),
      NavBarItem(
          text: 'Interests',
          onTap: () {
            scrollToWidgetByKey(skillsKey);
            collapsableHeight.value = 0.0;
          }),
      NavBarItem(
          text: 'Github',
          onTap: () async {
            await launchUrl(Uri.parse(github));
          }),
      NavBarItem(
          text: 'Facebook',
          onTap: () async => await launchUrl(Uri.parse(facebook))),
      NavBarItem(
          text: 'LinkedIn',
          onTap: () async => await launchUrl(Uri.parse(linkedIn))),
    ];
    return Stack(
      children: [
        ObxValue<RxDouble>(
            (data) => AnimatedContainer(
                  margin: const EdgeInsets.only(top: 110.0),
                  duration: const Duration(milliseconds: 375),
                  curve: Curves.ease,
                  height: data.value,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: CustomColors.darkBackground,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: navBarColumn,
                    ),
                  ),
                ),
            collapsableHeight),
        Container(
          height: 80.0,
          margin: const EdgeInsets.only(top: 40.0),
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: (width < Breakpoints.xlg)
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(left: width * 0.04),
                        child: Logo(
                          width: width,
                          scrollController: scrollController,
                        )),
                    NavBarButton(
                        onPressed: () {
                          if (collapsableHeight.value == 0.0) {
                            collapsableHeight.value = 240.0;
                          } else if (collapsableHeight.value == 240.0) {
                            collapsableHeight.value = 0.0;
                          }
                        },
                        width: width),
                  ],
                )
              : navBarRow,
        ),
      ],
    );
  }
}
