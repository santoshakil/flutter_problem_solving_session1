import 'package:hive/hive.dart';

part 'model.g.dart';

@HiveType(typeId: 0)
class WidgetPosition extends HiveObject {
  @HiveField(0)
  late double top;
  @HiveField(1)
  late double left;

  WidgetPosition({required this.left, required this.top});
}
