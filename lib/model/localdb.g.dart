// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'localdb.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalDBModelAdapter extends TypeAdapter<LocalDBModel> {
  @override
  final int typeId = 1;

  @override
  LocalDBModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalDBModel(
      newsHead: fields[0] as String,
      newsDes: fields[1] as String,
      newsImg: fields[2] as String,
      newsUrl: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, LocalDBModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.newsHead)
      ..writeByte(1)
      ..write(obj.newsDes)
      ..writeByte(2)
      ..write(obj.newsImg)
      ..writeByte(3)
      ..write(obj.newsUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalDBModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
