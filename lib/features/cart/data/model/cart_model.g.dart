// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CartModelAdapter extends TypeAdapter<CartModel> {
  @override
  final int typeId = 1;

  @override
  CartModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CartModel(
      shoeTitle: fields[1] as String,
      id: fields[8] as String,
      price: fields[9] as double,
      oldPrice: fields[10] as double,
      shoeImg: fields[2] as String,
      shoediscrip: fields[3] as String,
      size: fields[6] as int,
      quantity: fields[4] as int,
      brand: fields[7] as String,
      time: fields[5] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, CartModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(1)
      ..write(obj.shoeTitle)
      ..writeByte(2)
      ..write(obj.shoeImg)
      ..writeByte(3)
      ..write(obj.shoediscrip)
      ..writeByte(4)
      ..write(obj.quantity)
      ..writeByte(5)
      ..write(obj.time)
      ..writeByte(6)
      ..write(obj.size)
      ..writeByte(7)
      ..write(obj.brand)
      ..writeByte(8)
      ..write(obj.id)
      ..writeByte(9)
      ..write(obj.price)
      ..writeByte(10)
      ..write(obj.oldPrice);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
