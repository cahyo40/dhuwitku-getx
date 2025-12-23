import 'package:dhuwitku/apps/data/model/workspace_model.dart';
import 'package:dhuwitku/apps/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:yo_ui/yo_ui.dart';

class CardTransactionWidget extends StatelessWidget {
  final WorkspaceModel workspaceModel;
  const CardTransactionWidget({super.key, required this.workspaceModel});

  @override
  Widget build(BuildContext context) {
    return YoCard.filled(
      child: Row(
        spacing: YoSpacing.md,
        children: [
          YoAvatar.icon(
            icon: Iconsax.car_outline,
            backgroundColor: errorColor.withValues(alpha: .2),
            iconColor: errorColor,
            size: YoAvatarSize.lg,
            showBadge: true,
            customBadge: YoAvatar.image(
              imageUrl: workspaceModel.imageUrl,
              size: YoAvatarSize.xs,
            ),
          ),

          Expanded(
            child: Column(
              spacing: YoSpacing.sm,
              crossAxisAlignment: .start,
              children: [
                YoText.bodyMedium(
                  "INCOME",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  spacing: YoSpacing.xs,
                  children: [
                    Flexible(
                      child: YoText.bodySmall(
                        "Category",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        color: gray400,
                      ),
                    ),
                    YoText.bodySmall(
                      YoDateFormatter.getRelativeDay(DateTime.now()),
                      color: gray400,
                    ),
                  ],
                ),
              ],
            ),
          ),
          YoText.monoMedium(
            YoCurrencyFormatter.formatCurrency(50000),
            color: successColor,
          ),
        ],
      ),
    );
  }
}
