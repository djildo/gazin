import 'package:flutter_test/flutter_test.dart';
import 'package:teste/app/modules/clientes/clientes_store.dart';
 
void main() {
  late ClientesStore store;

  setUpAll(() {
    store = ClientesStore();
  });

  test('increment count', () async {
    expect(store.state, equals(0));
    store.update(store.state + 1);
    expect(store.state, equals(1));
  });
}