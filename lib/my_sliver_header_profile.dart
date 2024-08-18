import 'package:animated_profile_picture/custom_text.dart';
import 'package:flutter/material.dart';

class MySliverHeaderProfile extends SliverPersistentHeaderDelegate {
  MySliverHeaderProfile({required this.name, required this.maxH});

  final Widget name;
  final double maxH;

  final profilePicAvatarTween =
      EdgeInsetsTween(end: const EdgeInsets.only(left: 50.0, top: 53.0));

  final titleMarginTween = EdgeInsetsTween(
      begin: const EdgeInsets.only(left: 10, bottom: 10),
      end: const EdgeInsets.only(right: 70, top: 50.0));

  final iconMarginTween = EdgeInsetsTween(
    begin: const EdgeInsets.only(top: 70, right: 20, bottom: 10),
  );

  final profilePicAlignTween =
      AlignmentTween(begin: Alignment.center, end: Alignment.centerLeft);

  final titleAlignTween =
      AlignmentTween(begin: Alignment.bottomLeft, end: Alignment.center);

  final iconAlignTween =
      AlignmentTween(begin: Alignment.bottomRight, end: Alignment.centerRight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    double tempVal = 70 * maxExtent / 100;

    final progress = shrinkOffset > tempVal ? 1.0 : shrinkOffset / tempVal;

    final profilePicMargin = profilePicAvatarTween.lerp(progress);
    final profilePicAlign = profilePicAlignTween.lerp(progress);

    final titleMargin = titleMarginTween.lerp(progress);
    final titleAlign = titleAlignTween.lerp(progress);

    final iconMargin = iconMarginTween.lerp(progress);
    final iconAlign = iconAlignTween.lerp(progress);

    return Stack(
      children: [
        Container(
          color: const Color.fromARGB(255, 7, 126, 42),
          height: minExtent,
          child: const Padding(
            padding: EdgeInsets.only(left: 10, right: 10, top: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.arrow_back,
                  color: Colors.white70,
                ),
                Icon(
                  Icons.more_vert,
                  color: Colors.white70,
                ),
              ],
            ),
          ),
        ),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 60),
          transitionBuilder: (child, animation) {
            return ScaleTransition(
              scale: animation,
              child: child,
            );
          },
          child: (progress < 0.8)
              ? Container(
                  constraints: BoxConstraints(
                      minHeight: minExtent, maxHeight: maxExtent),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('asset/image/belle.jpg'),
                        fit: BoxFit.cover),
                  ),
                )
              : Padding(
                  padding: profilePicMargin,
                  child: Align(
                    alignment: profilePicAlign,
                    child: const CircleAvatar(
                      radius: 35,
                      backgroundImage: AssetImage('asset/image/belle.jpg'),
                    ),
                  ),
                ),
        ),
        Padding(
          padding: titleMargin,
          child: Align(
            alignment: titleAlign,
            child: CustomText(
              textSize: 18 + (12 * (1 - progress)),
              bold: false,
              child: const Text('Miss Africa'),
            ),
          ),
        ),
        Padding(
          padding: iconMargin,
          child: Align(
            alignment: iconAlign,
            child: AnimatedOpacity(
              opacity: (progress > 0.8) ? 0.0 : 1.0,
              duration: const Duration(milliseconds: 100),
              child: const Icon(
                Icons.add_a_photo,
                size: 40,
                color: Colors.white,
              ),
            ),
          ),
        ),
        SizedBox(
          height: minExtent,
          child: const Padding(
            padding: EdgeInsets.only(left: 10, right: 10, top: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                Icon(
                  Icons.more_vert,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => maxH;

  @override
  double get minExtent => 125;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
