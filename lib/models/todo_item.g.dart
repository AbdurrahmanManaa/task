// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TodoItemModelAdapter extends TypeAdapter<TodoItemModel> {
  @override
  final int typeId = 0;

  @override
  TodoItemModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TodoItemModel(
      title: fields[0] as String,
      detail: fields[1] as String,
      isCompleted: fields[2] == null ? false : fields[2] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, TodoItemModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.detail)
      ..writeByte(2)
      ..write(obj.isCompleted);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TodoItemModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
