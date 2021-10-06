import 'package:flutter_test/flutter_test.dart';
import 'package:teste/app/modules/cadastro/cadastro_store.dart';

void main() {
  late CadastroStore store;

  setUpAll(() {
    store = CadastroStore();
  });

  test('increment count', () async {
    expect(store.state, equals(0));
    store.update(store.state + 1);
    expect(store.state, equals(1));
  });
}
