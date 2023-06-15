import 'package:flutter/material.dart';
import 'package:the_forget_me_not_list/theme/custom_theme.dart';

class CustomSliverAppBar extends SliverPersistentHeaderDelegate {
  final currentTheme = CustomTheme.fetchCurrentTheme();

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final colors = currentTheme.customColors;

    double percent = shrinkOffset / (maxExtent - minExtent);
    percent = percent > 1 ? 1 : percent;

    return Container(
      decoration: BoxDecoration(
        color: colors.backPrimary,
        boxShadow: [
          if (percent == 1) ...[
            const BoxShadow(
              color: Color(0x33000000),
              offset: Offset(0, 1),
              blurRadius: 10,
              spreadRadius: 0,
            ),
            const BoxShadow(
              color: Color(0x1F000000),
              offset: Offset(0, 4),
              blurRadius: 5,
              spreadRadius: 0,
            ),
            const BoxShadow(
              color: Color(0x24000000),
              offset: Offset(0, 2),
              blurRadius: 4,
              spreadRadius: 0,
            ),
          ]
        ],
      ),
      child: Stack(
        children: <Widget>[
          _buildTitle(percent),
        ],
      ),
    );
  }

  Widget _buildTitle(double percent) {
    final typography = currentTheme.customTypography;

    final textStyleTween = TextStyleTween(
      begin: typography.largeTitle,
      end: typography.title,
    );

    return Positioned(
      left: 60 - percent * 44,
      bottom: 16 - percent * 12,
      child: Text('Мои дела', style: textStyleTween.lerp(percent)),
    );
  }

  @override
  double get maxExtent => 124;

  @override
  double get minExtent => 88;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => false;
}
