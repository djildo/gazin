import 'package:flutter/material.dart';
import 'package:teste/app/modules/cadastro/cadastro_store.dart';
import 'package:teste/carregando.dart';
import 'package:teste/constants/route_names.dart';
import 'package:teste/widgets/textField.dart';

class CadastroPage extends StatefulWidget {
  final String title;
  const CadastroPage({Key? key, this.title = 'Cadastrar Developer'})
      : super(key: key);
  @override
  CadastroPageState createState() => CadastroPageState();
}

class CadastroPageState extends State<CadastroPage> {
  final _controller = CadastroController();
  TextEditingController _nome = TextEditingController();
  TextEditingController _sexo = TextEditingController();
  TextEditingController _idade = TextEditingController();
  TextEditingController _hobby = TextEditingController();
  TextEditingController _datanascimento = TextEditingController();

  var tap = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0F233D),
        title: Text(
          widget.title,
          style: TextStyle(
            color: Colors.blueAccent,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      alignment: AlignmentDirectional.topCenter,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top: 10.0),
                          ),
                          TextFromField(
                            icon: Icons.tag_faces_outlined,
                            password: false,
                            email: "Nome*",
                            inputType: TextInputType.text,
                            telefone: false,
                            controller: _nome,
                          ),
                          Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
                          TextFromField(
                            icon: Icons.female_outlined,
                            password: false,
                            email: "Sexo",
                            inputType: TextInputType.text,
                            telefone: false,
                            controller: _sexo,
                          ),
                          Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
                          TextFromField(
                            icon: Icons.filter_7_outlined,
                            password: false,
                            email: "Idade",
                            inputType: TextInputType.number,
                            telefone: false,
                            controller: _idade,
                          ),
                          Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
                          TextFromField(
                            icon: Icons.pedal_bike_outlined,
                            password: false,
                            email: "Hobby",
                            inputType: TextInputType.text,
                            telefone: false,
                            controller: _hobby,
                          ),
                          Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
                          TextFromField(
                            icon: Icons.date_range_outlined,
                            password: false,
                            email: "Data Nascimento",
                            inputType: TextInputType.text,
                            telefone: true,
                            controller: _datanascimento,
                          ),
                          Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
                          tap == 0
                              ? InkWell(
                                  onTap: () async {
                                    if (_nome.text == '') {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text('Nome é obrigatório!'),
                                        duration: Duration(seconds: 2),
                                        action: SnackBarAction(
                                          label: 'FECHAR',
                                          onPressed: () {},
                                        ),
                                      ));

                                      return;
                                    }

                                    setState(() {
                                      tap = 1;
                                    });

                                    new Carregando();

                                    dynamic res = await _controller.logar(
                                        context,
                                        _nome.text,
                                        _sexo.text,
                                        _idade.text,
                                        _hobby.text,
                                        _datanascimento.text);

                                    if (res != null && res['success'] == true) {
                                      _controller.navigateTo(
                                          context, RouteNames.developer, 2);
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text(res.message),
                                        duration: Duration(seconds: 2),
                                        action: SnackBarAction(
                                          label: 'FECHAR',
                                          onPressed: () {},
                                        ),
                                      ));
                                    }
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30.0),
                                    child: Container(
                                      alignment: FractionalOffset.center,
                                      height: 49.0,
                                      width: 250.0,
                                      decoration: BoxDecoration(
                                        color: Colors.blueAccent,
                                        borderRadius:
                                            BorderRadius.circular(40.0),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black26,
                                              blurRadius: 15.0)
                                        ],
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            "CADASTRAR",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'Sofia',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              : Carregando(),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
