import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SegundaView extends StatefulWidget {
  const SegundaView({Key? key}) : super(key: key);

  @override
  State<SegundaView> createState() => _SegundaViewState();
}

class _SegundaViewState extends State<SegundaView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      color: Colors.blue,
    ));
  }
}
