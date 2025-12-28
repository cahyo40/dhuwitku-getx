import 'package:dhuwitku/apps/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:yo_ui/yo_ui.dart';

class CardBudgetWidget extends StatelessWidget {
  const CardBudgetWidget({super.key, this.onTap});

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final double progressWidth = context.width * 0.825;
    return Padding(
      padding: YoPadding.bottom16,
      child: YoCard(
        onTap: onTap,
        child: SizedBox(
          child: YoColumn(
            spacing: YoSpacing.md,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              YoRow(
                spacing: YoSpacing.md,
                children: [
                  YoAvatar.icon(
                    icon: FontAwesome.burger_solid,
                    iconColor: textColor,
                    variant: YoAvatarVariant.rounded,
                    backgroundColor: textColor.withOpacity(.25),
                  ),
                  Expanded(
                    child: YoColumn(
                      crossAxisAlignment: .start,
                      children: [
                        YoText.titleMedium(
                          "Makan Siang",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.bold,
                        ),
                        YoText.bodySmall("Pribadi", color: gray400),
                      ],
                    ),
                  ),
                  YoChip(label: "74%", backgroundColor: backgroundColor),
                ],
              ),
              Center(
                child: SizedBox(
                  height: 16,
                  width: progressWidth,
                  child: Stack(
                    children: [
                      Container(
                        height: 16,
                        width: progressWidth,
                        decoration: BoxDecoration(
                          borderRadius: YoAdaptive.borderRadiusMd(context),
                          color: primaryColor.withOpacity(.25),
                        ),
                      ),
                      Container(
                        height: 16,
                        width: progressWidth * 0.75,
                        decoration: BoxDecoration(
                          borderRadius: YoAdaptive.borderRadiusMd(context),
                          color: primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              YoRow(
                mainAxisAlignment: .spaceBetween,
                children: [
                  YoRow(
                    children: [
                      YoText.bodyMedium("Target ", color: gray400),
                      YoText.monoMedium(
                        "Rp 100.000",
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  YoRow(
                    children: [
                      YoText.bodyMedium("Sisa ", color: gray400),
                      YoText.monoMedium(
                        "Rp 100.000",
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
