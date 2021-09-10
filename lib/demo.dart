import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'model.dart';

class KDemoClass extends StatefulWidget {
  const KDemoClass({
    Key? key,
  }) : super(key: key);

  @override
  State<KDemoClass> createState() => _KDemoClassState();
}

class _KDemoClassState extends State<KDemoClass> {
  @override
  Widget build(BuildContext context) {
    var _postion = Hive.box<WidgetPosition>('positions').get(0);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: const Center(
                child: Text('asdasd'),
              ),
            ),
            Draggable(
              feedback: _KIcon(x: _postion!.top, y: _postion.left),
              child: _KIcon(x: _postion.top, y: _postion.left),
              onDragEnd: (v) async {
                print(v.offset.dx);
                var _box = Hive.box<WidgetPosition>('positions');
                print('Old: ' + _box.get(0)!.left.toString());
                await _box.put(
                  0,
                  WidgetPosition(
                    top: v.offset.dx,
                    left: v.offset.dy,
                  ),
                );
                print('New: ' + _box.get(0)!.left.toString());
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _KIcon extends StatelessWidget {
  final double x, y;

  const _KIcon({
    Key? key,
    required this.x,
    required this.y,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PositionedDirectional(
      top: x,
      start: y,
      child: const Icon(Icons.ac_unit, size: 30),
    );
  }
}
