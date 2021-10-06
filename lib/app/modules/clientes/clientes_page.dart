import 'package:flutter/material.dart';
import 'package:teste/app/modules/clientes/clientes_store.dart';
import 'package:teste/carregando.dart';
import 'package:teste/model/developer_model.dart';

class ClientesPage extends StatefulWidget {
  final String title;
  const ClientesPage({Key? key, this.title = 'Developers'}) : super(key: key);
  @override
  ClientesPageState createState() => ClientesPageState();
}

class ClientesPageState extends State<ClientesPage> {
  final _controller = ClientesController();

  stateManagement(pState state) {
    switch (state) {
      case pState.start:
        return Center(
          child: Text("Carregando..."),
        );
      case pState.loading:
        return Carregando();
      case pState.success:
        return _controller.todos.length > 0
            ? ListView.builder(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemCount: _controller.todos.length,
                itemBuilder: (context, i) {
                  return _card(_controller.todos[i]);
                },
              )
            : Center(
                child: Container(
                  child: Text('Nenhum endereço cadastrado :('),
                ),
              );
      case pState.error:
        return Center(
          child: Text("Erro ao carregar..."),
        );
      default:
        return;
    }
  }

  @override
  void initState() {
    super.initState();
    _controller.listar(context);
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
              Column(
                children: <Widget>[
                  SizedBox(
                    height: 20.0,
                  ),
                  AnimatedBuilder(
                    animation: _controller.state,
                    builder: (context, child) {
                      return stateManagement(_controller.state.value);
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _line() {
    return Container(
      height: 1.0,
      width: double.infinity,
      color: Colors.white10,
    );
  }

  Widget _card(Data dev) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0),
            child: Container(
              height: 120.0,
              width: double.infinity,
              decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(25.0)), color: Color(0xFF232D4E), border: Border.all(color: Colors.white10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 10.0, bottom: 10.0),
                    child: Text(
                      "Nome: " + dev.nome!,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Sans",
                        fontWeight: FontWeight.w200,
                        letterSpacing: 1.5,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  _line(),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, left: 15.0),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.wallet_giftcard,
                          color: Colors.white,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Hobby: " + dev.hobby!,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Popins",
                                    fontWeight: FontWeight.w200,
                                    letterSpacing: 1.5,
                                    fontSize: 17.0,
                                  ),
                                ),
                                Text(
                                  "Sexo: " + dev.sexo!,
                                  style: TextStyle(
                                    fontFamily: "Sans",
                                    fontWeight: FontWeight.w300,
                                    letterSpacing: 1.5,
                                    fontSize: 14.0,
                                    color: Colors.white24,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () => {},
                                child: Icon(
                                  Icons.edit,
                                  color: Colors.blueAccent,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              InkWell(
                                onTap: () => {_controller.apagar(context, dev.idDevelopers!)},
                                child: Icon(
                                  Icons.delete_outline_outlined,
                                  color: Colors.redAccent,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 30.0),
              child: Container(
                height: 40.0,
                width: 130.0,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(30.0)), gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, tileMode: TileMode.repeated, colors: [Color(0xFF15EDED), Color(0xFF029CF5)])),
                child: Center(
                  child: Text(
                    "Idade: " + dev.idade!,
                    style: TextStyle(fontFamily: "Sans", color: Colors.white, fontWeight: FontWeight.w700, letterSpacing: 1.5, fontSize: 15.0),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
