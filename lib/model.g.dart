// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WidgetPositionAdapter extends TypeAdapter<WidgetPosition> {
  @override
  final int typeId = 0;

  @override
  WidgetPosition read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WidgetPosition(
      left: fields[1] as double,
      top: fields[0] as double,
    );
  }

  @override
  void write(BinaryWriter writer, WidgetPosition obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.top)
      ..writeByte(1)
      ..write(obj.left);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WidgetPositionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
