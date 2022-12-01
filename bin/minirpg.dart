import 'package:minirpg/Classes/guerreiro.dart';

void main(List<String> arguments) {
  Guerreiro guerreiro1 = Guerreiro("Guerreiro", 150, 45, 10, 45);
  Guerreiro guerreiro2 = Guerreiro("Guerreiro", 150, 45, 10, 45);
  guerreiro1.atacarAlvo(guerreiro2);
  print("object");
}
