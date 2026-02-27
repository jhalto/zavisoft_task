import 'package:flutter/material.dart';
import 'package:zavisoft_task/core/const/app_colors.dart';
import 'package:zavisoft_task/core/const/app_text_style.dart';


class CustomFullwidthButton extends StatelessWidget {
  const CustomFullwidthButton({
    super.key,
    required this.onTap,
    required this.title,
    this.color,
    this.paddingVertical,
    this.radius,
    this.fontSize,
    this.fontWeight,

    this.width,
    this.fontColor,
    this.paddingHorizontal,
  });

  final VoidCallback onTap;
  final String title;
  final Color? color;
  final Color? fontColor;
  final double? paddingVertical;
  final double? radius;
  final double? fontSize;
  final FontWeight? fontWeight;

  final double? width;
  final double? paddingHorizontal;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(radius ?? 10),
      onTap: onTap,
      child: Material(
        child: Ink(
          width: width ?? double.infinity,
          padding: EdgeInsets.symmetric(vertical: paddingVertical ?? 18),
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
        
            borderRadius: BorderRadius.circular(radius ?? 10),
          ),
        
          child: Center(
            child: Text(
              title,
              style: AppTextStyle.titleMedium.copyWith(
                color: fontColor ?? Colors.black,
                fontSize: fontSize ?? 18,
                fontWeight: fontWeight ?? FontWeight.w600,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              softWrap: false,
            ),
          ),
        ),
      ),
    );
  }
}
