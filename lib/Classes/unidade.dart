abstract class Unidade {
  late String _nome;
  late double _health;
  late double healthN;
  late double _attack;
  late double _speed;

  double getHealth() => _health;

  Unidade(this._nome, this._health, this._attack, this._speed, this.healthN);

  void receberDano(double dano) {
    dano = _attack;
    if (healthN - dano <= 0) {
      healthN = 0;
    } else if (healthN - dano >= _health) {
      healthN = healthN;
    } else {
      healthN = healthN - dano;
    }
  }

  void atacarAlvo(Unidade unidade) {
    unidade.atacarAlvo(receberDano(_attack));
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
