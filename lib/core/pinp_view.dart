import 'package:flutter/material.dart';

/// PinP を表示できる View
class PinPView extends StatelessWidget {
  const PinPView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.translationValues(190, 30, 0),
      child: const UiKitView(viewType: 'sample'),
    );
  }
}
