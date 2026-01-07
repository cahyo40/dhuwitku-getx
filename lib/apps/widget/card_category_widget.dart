import 'package:dhuwitku/apps/core/utils/string.dart';
import 'package:dhuwitku/apps/data/model/category_model.dart';
import 'package:dhuwitku/apps/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:yo_ui/yo_ui.dart';

class CardCategoryWidget extends StatelessWidget {
  final CategoryModel category;
  final int countTransaction;
  final void Function()? onTap;

  const CardCategoryWidget({
    super.key,
    required this.category,
    required this.countTransaction,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: YoRow(
        margin: YoPadding.bottom16,
        spacing: YoAdaptive.spacingMd(context),
        children: [
          YoAvatar.icon(
            iconColor: Color(category.color),
            backgroundColor: Color(category.color).withOpacity(.25),
            variant: YoAvatarVariant.rounded,
            size: YoAvatarSize.lg,
            icon: IconData(
              category.icon.codePoint,
              fontFamily: category.icon.fontFamily,
              fontPackage: category.icon.fontPackage,
            ),
          ),
          Expanded(
            child: YoColumn(
              crossAxisAlignment: .start,
              spacing: YoAdaptive.spacingSm(context),
              children: [
                YoText.titleMedium(
                  category.name.toUpperCase(),
                  fontWeight: .bold,
                ),
                YoText.labelSmall(
                  YoStringHelpers.transaction(category.type.name).toUpperCase(),
                  color: gray400,
                ),
              ],
            ),
          ),
          Visibility(
            visible: countTransaction > 0,
            child: YoBadge.outline(text: countTransaction.toString()),
          ),
        ],
      ),
    );
  }
}
