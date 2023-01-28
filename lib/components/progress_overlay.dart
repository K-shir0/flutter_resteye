import 'package:flutter/material.dart';
import 'package:flutter_resteye/constants.dart';

import 'package:loading_overlay/loading_overlay.dart';

class ProgressOverlay extends StatelessWidget {
  const ProgressOverlay({
    super.key,
    required this.child,
    this.inProgress = false,
  });

  final Widget child;
  final bool inProgress;

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      isLoading: inProgress,
      progressIndicator:
          const CircularProgressIndicator(color: AppColors.indicatorColor),
      child: child,
    );
  }
}
