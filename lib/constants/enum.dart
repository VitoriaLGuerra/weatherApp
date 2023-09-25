enum TempEnum {
  CLEAR,
  CLOUDS,
  RAIN
}
final tempEnumValues = EnumValues({
  "Clear": TempEnum.CLEAR,
  "Clouds": TempEnum.CLOUDS,
  "Rain": TempEnum.RAIN
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}