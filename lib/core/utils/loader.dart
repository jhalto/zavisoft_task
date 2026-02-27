import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:zavisoft_task/core/const/app_colors.dart';

final loader = Center(
  child: LoadingAnimationWidget.fourRotatingDots(
    color: AppColors.primaryColor,
    size: 50,
  ),
);
