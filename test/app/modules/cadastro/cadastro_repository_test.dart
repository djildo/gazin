import 'package:flutter_test/flutter_test.dart';
import 'package:teste/app/modules/cadastro/cadastro_repository.dart';
 
void main() {
  late CadastroRepository repository;

  setUpAll(() {
    repository = CadastroRepository();
  });
}