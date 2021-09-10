import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'model.dart';

class KDemoClass extends StatelessWidget {
  const KDemoClass({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: const [
            _KIcon(),
          ],
        ),
      ),
    );
  }
}

class _KIcon extends StatefulWidget {
  const _KIcon({
    Key? key,
  }) : super(key: key);

  @override
  State<_KIcon> createState() => _KIconState();
}

class _KIconState extends State<_KIcon> {
  @override
  Widget build(BuildContext context) {
    var _postion = Hive.box<WidgetPosition>('positions').get(0);

    return PositionedDirectional(
      top: _postion!.top,
      start: _postion.left,
      child: Draggable(
        feedback: const Icon(Icons.ac_unit, size: 30),
        onDragEnd: (v) async {
          var _box = Hive.box<WidgetPosition>('positions');
          await _box.put(
            0,
            WidgetPosition(top: v.offset.dx, left: v.offset.dy),
          );
          setState(() {});
        },
        child: const Icon(Icons.ac_unit, size: 30),
      ),
    );
  }
}
