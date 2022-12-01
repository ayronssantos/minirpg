class Unidade {
  late String _nome;
  late double _health;
  late double _attack;
  late double _speed;

  Unidade(this._nome, this._health, this._attack, this._speed) {
    _nome = nome;
    _health = health;
    _attack = attack;
    _speed;
  }

  @override
  String toString() {
    return {
      "Nome": _nome,
      "Health": _health,
      "Attack": _attack,
      "Speed": _speed
    }.toString();
  }
}
