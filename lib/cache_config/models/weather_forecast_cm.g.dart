// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_forecast_cm.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WeatherForecastCMAdapter extends TypeAdapter<WeatherForecastCM> {
  @override
  final int typeId = 0;

  @override
  WeatherForecastCM read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WeatherForecastCM(
      cod: fields[0] as String?,
      message: fields[1] as dynamic,
      cnt: fields[2] as int?,
      list: (fields[3] as List?)?.cast<WeatherListCM>(),
      city: fields[4] as CityCM?,
      timestamp: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, WeatherForecastCM obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.cod)
      ..writeByte(1)
      ..write(obj.message)
      ..writeByte(2)
      ..write(obj.cnt)
      ..writeByte(3)
      ..write(obj.list)
      ..writeByte(4)
      ..write(obj.city)
      ..writeByte(5)
      ..write(obj.timestamp);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherForecastCMAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CityCMAdapter extends TypeAdapter<CityCM> {
  @override
  final int typeId = 1;

  @override
  CityCM read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CityCM(
      id: fields[0] as int?,
      name: fields[1] as String?,
      country: fields[2] as String?,
      population: fields[3] as int?,
      timezone: fields[4] as int?,
      sunrise: fields[5] as int?,
      sunset: fields[6] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, CityCM obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.country)
      ..writeByte(3)
      ..write(obj.population)
      ..writeByte(4)
      ..write(obj.timezone)
      ..writeByte(5)
      ..write(obj.sunrise)
      ..writeByte(6)
      ..write(obj.sunset);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CityCMAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class WeatherListCMAdapter extends TypeAdapter<WeatherListCM> {
  @override
  final int typeId = 2;

  @override
  WeatherListCM read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WeatherListCM(
      dt: fields[0] as int?,
      main: fields[1] as MainCM?,
      weather: (fields[2] as List?)?.cast<WeatherCM>(),
      wind: fields[3] as WindCM?,
      visibility: fields[4] as int?,
      pop: fields[5] as double?,
      dtTxt: fields[6] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, WeatherListCM obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.dt)
      ..writeByte(1)
      ..write(obj.main)
      ..writeByte(2)
      ..write(obj.weather)
      ..writeByte(3)
      ..write(obj.wind)
      ..writeByte(4)
      ..write(obj.visibility)
      ..writeByte(5)
      ..write(obj.pop)
      ..writeByte(6)
      ..write(obj.dtTxt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherListCMAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MainCMAdapter extends TypeAdapter<MainCM> {
  @override
  final int typeId = 3;

  @override
  MainCM read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MainCM(
      temp: fields[0] as double?,
      feelsLike: fields[1] as double?,
      tempMin: fields[2] as double?,
      tempMax: fields[3] as double?,
      pressure: fields[4] as int?,
      seaLevel: fields[5] as int?,
      grndLevel: fields[6] as int?,
      humidity: fields[7] as int?,
      tempKf: fields[8] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, MainCM obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.temp)
      ..writeByte(1)
      ..write(obj.feelsLike)
      ..writeByte(2)
      ..write(obj.tempMin)
      ..writeByte(3)
      ..write(obj.tempMax)
      ..writeByte(4)
      ..write(obj.pressure)
      ..writeByte(5)
      ..write(obj.seaLevel)
      ..writeByte(6)
      ..write(obj.grndLevel)
      ..writeByte(7)
      ..write(obj.humidity)
      ..writeByte(8)
      ..write(obj.tempKf);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MainCMAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class WeatherCMAdapter extends TypeAdapter<WeatherCM> {
  @override
  final int typeId = 4;

  @override
  WeatherCM read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WeatherCM(
      id: fields[0] as int?,
      main: fields[1] as String?,
      description: fields[2] as String?,
      icon: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, WeatherCM obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.main)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.icon);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherCMAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class WindCMAdapter extends TypeAdapter<WindCM> {
  @override
  final int typeId = 5;

  @override
  WindCM read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WindCM(
      speed: fields[0] as double?,
      deg: fields[1] as int?,
      gust: fields[2] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, WindCM obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.speed)
      ..writeByte(1)
      ..write(obj.deg)
      ..writeByte(2)
      ..write(obj.gust);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WindCMAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
