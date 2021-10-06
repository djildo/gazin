import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:localstorage/localstorage.dart';
import 'package:teste/app/modules/login/login_store.dart';
import 'package:flutter/material.dart';
import 'package:teste/widgets/textField.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key? key, this.title = 'LoginPage'}) : super(key: key);
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final LoginStore store = Modular.get();
  TextEditingController _login = TextEditingController();
  TextEditingController _senha = TextEditingController();
  bool isChecked = false;
  final LocalStorage storage = new LocalStorage('pedeaki.json');

  @override
  void initState() {
    storage.ready.then((_) {
      if (storage.getItem('lembrar') == true)
        setState(() {
          _login.text = storage.getItem('login');
          _senha.text = storage.getItem('senha');
          isChecked = true;
        });
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        height: MediaQuery.of(context).size.height,
        child: new GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(new FocusNode());
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 60,
                  ),
                  Container(
                    width: double.infinity,
                    margin:
                        EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.height / 2,
                          margin: EdgeInsets.symmetric(
                              vertical: 16.0, horizontal: 16.0),
                          child: Column(
                            children: [
                              Container(
                                child: Image.asset(
                                  'assets/logo.png',
                                  width: 120,
                                  scale: 1,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              ScopedBuilder<LoginStore, Exception, bool>(
                                store: store,
                                onState: (_, retorno) {
                                  if (!retorno)
                                    return Column(
                                      children: [
                                        TextFromField(
                                          icon: Icons.phone_iphone_outlined,
                                          password: false,
                                          email: "LOGIN",
                                          inputType: TextInputType.text,
                                          telefone: false,
                                          controller: _login,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        TextFromField(
                                          icon: Icons.vpn_key,
                                          password: true,
                                          email: "SENHA",
                                          inputType: TextInputType.text,
                                          telefone: false,
                                          controller: _senha,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Checkbox(
                                              checkColor: Colors.white,
                                              value: isChecked,
                                              onChanged: (bool? value) {
                                                if (_login.text != '' &&
                                                    _senha.text != '') {
                                                  if (value == true) {
                                                    storage.setItem(
                                                        'login', _login.text);
                                                    storage.setItem(
                                                        'senha', _senha.text);
                                                    storage.setItem(
                                                        'lembrar', true);
                                                  } else {
                                                    storage.setItem(
                                                        'login', '');
                                                    storage.setItem(
                                                        'senha', '');
                                                    storage.setItem(
                                                        'lembrar', false);
                                                  }
                                                  setState(() {
                                                    isChecked = value!;
                                                  });
                                                } else {
                                                  setState(() {
                                                    isChecked = false;
                                                  });
                                                }
                                              },
                                            ),
                                            Text(
                                              'Lembrar-me?',
                                              style: TextStyle(
                                                fontSize: 15.0,
                                                fontFamily: 'Sans',
                                                letterSpacing: 0.3,
                                                color: Colors.white70,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        ElevatedButton.icon(
                                          onPressed: () => store.logar(context,
                                              _login.text, _senha.text),
                                          icon: Icon(Icons
                                              .check_circle_outline_outlined),
                                          label: Text('ENTRAR'),
                                        ),
                                      ],
                                    );

                                  return Center();
                                },
                                onError: (context, error) => Center(
                                  child: Column(
                                    children: [
                                      Text(
                                        'Erro ao Logar. :)',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      ElevatedButton.icon(
                                        onPressed: () => store.tentar(),
                                        icon: Icon(Icons
                                            .check_circle_outline_outlined),
                                        label: Text('TENTAR NOVAMENTE'),
                                      ),
                                    ],
                                  ),
                                ),
                                onLoading: (context) => Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.blueAccent,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
