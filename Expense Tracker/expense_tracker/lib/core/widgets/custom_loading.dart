import 'package:expense_tracker/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CustomLoading extends StatelessWidget {

  final bool isLoading;

  final Widget child;

  final Color backgroundColor;

  final Color indicatorColor;

  final double opacity;

  const CustomLoading({
    super.key,

    required this.isLoading,

    required this.child,

    this.backgroundColor = Colors.black,

    this.indicatorColor = AppColors.primary,

    this.opacity = 0.35,
  });

  @override
  Widget build(BuildContext context) {

    return Stack(

      children: [

        /// MAIN SCREEN
        child,

        /// LOADING OVERLAY
        if (isLoading)

          Container(

            width: double.infinity,
            height: double.infinity,

            color: backgroundColor.withOpacity(opacity),

            child: Center(

              child: CircularProgressIndicator(

                color: indicatorColor,
                strokeWidth: 3,
              ),
            ),
          ),
      ],
    );
  }
}