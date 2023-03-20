/// Enum with the constant values of the characters data layer
enum CharactersConst {
  /// EndPoint to obtain the information of characters
  charactersEndPoint('/v1/public/characters');

  /// Constructor
  const CharactersConst(this.value);

  /// Represents the value of each enum
  final String value;
}
