import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}

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

/// PinP を操作するためのコントローラ
class PinPController {
  PinPController();

  final _channel =
      const MethodChannel('jp.kshiro.resteye.flutterResteye/sample');

  Future<void> toggle() async {
    await _channel.invokeMethod('toggle');
  }
}

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
