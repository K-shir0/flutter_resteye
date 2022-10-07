import 'package:flutter/material.dart';

import 'package:flutter_resteye/core/pinp_controller.dart';
import 'package:flutter_resteye/core/pinp_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = PinPController();

    return Scaffold(
      appBar: AppBar(title: const Text('RestEyes')),
      body: Column(
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 300),
            child: const PinPView(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.toggle(),
        tooltip: 'PinP',
        child: const Icon(Icons.add),
      ),
    );
  }
}
