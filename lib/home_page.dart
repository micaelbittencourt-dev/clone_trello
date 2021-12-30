import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollControllerCards = ScrollController();
  final ScrollController _scrollControllerCardsChildrens = ScrollController();

  List cards = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"];
  List<List<String>> cardsChildres = [
    [
      "REQ. 24423",
      "REQ.59433",
      "REQ. 24423",
      "REQ.59433",
      "REQ. 24423",
      "REQ.59433",
      "REQ. 24423",
      "REQ.59433"
    ],
    ["REQ. 24423", "REQ.59433", "REQ. 24423"],
    ["REQ. 24423", "REQ.59433", "REQ. 24423"],
    [],
    ["REQ. 24423", "REQ.59433", "REQ. 24423"],
    ["REQ. 24423", "REQ.59433", "REQ. 24423"],
    ["REQ. 24423", "REQ.59433", "REQ. 24423"],
    ["REQ. 24423", "REQ.59433", "REQ. 24423"],
    ["REQ. 24423", "REQ.59433", "REQ. 24423"],
    ["REQ. 24423", "REQ.59433", "REQ. 24423"],
  ];

  List<Map<String, dynamic>> listStatusReq = [
    {'name': 'BACKLOG', 'nameValue': 'R', 'value': true},
    {'name': 'AUTORIZADA', 'nameValue': 'R', 'value': true},
    {'name': 'ENCERRADA PELO DESENV', 'nameValue': 'R', 'value': true},
    {'name': 'CANCELADA', 'nameValue': 'R', 'value': true},
    {'name': 'QUARENTENA', 'nameValue': 'R', 'value': true},
    {'name': 'DBA', 'nameValue': 'R', 'value': true},
    {'name': 'DIGITAÇÃO', 'nameValue': 'R', 'value': true},
    {'name': 'LIB P/ DESENVOLVIMENTO', 'nameValue': 'R', 'value': true},
    {'name': 'NO TESTE', 'nameValue': 'R', 'value': true},
    {'name': 'LIBERADA P/ ENVIO', 'nameValue': 'R', 'value': true},
    {'name': 'ENTREGUE/ENCERRADA', 'nameValue': 'R', 'value': true},
    {'name': 'REVISÃO', 'nameValue': 'R', 'value': true},
    {'name': 'PENDENTE DE ANALISE', 'nameValue': 'R', 'value': true},
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Color(0xFF164a6a),
      appBar: AppBar(
        title: const Text('Requisição'),
        actions: [
          CircleAvatar(
            child: Text(
              'Teste'.substring(0, 1),
              style: const TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
      drawer: buildDrawer(context),
      body: _buildBody(),
    );
  }

  Drawer buildDrawer(BuildContext context) {
    return Drawer(
      child: Container(
        width: 400,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: Center(
                  child: ElevatedButton(
                      onPressed: () {
                        print('FILTRAR');
                      },
                      child: const Text('Filtrar'))),
            ),
            Expanded(
              child: Scrollbar(
                child: ListView.builder(
                    itemCount: listStatusReq.length,
                    itemBuilder: (context, x) => CheckboxListTile(
                        title: Text(listStatusReq[x]['name']),
                        value: true,
                        onChanged: (value) {})),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildBody() {
    return Scrollbar(
      isAlwaysShown: true,
      controller: _scrollControllerCards,
      child: ListView.builder(
        controller: _scrollControllerCards,
        scrollDirection: Axis.horizontal,
        itemCount: cards.length,
        itemBuilder: (context, index) {
          return _buildCard(context, index);
        },
      ),
    );
  }

  Widget _buildCard(BuildContext context, int index) {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            width: 300.0,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    blurRadius: 8,
                    offset: Offset(0, 0),
                    color: Color.fromRGBO(127, 140, 141, 0.5),
                    spreadRadius: 1)
              ],
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white,
            ),
            margin: const EdgeInsets.all(16.0),
            height: MediaQuery.of(context).size.height * 0.8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    cards[index],
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: Scrollbar(
                    controller: _scrollControllerCardsChildrens,
                    isAlwaysShown: true,
                    child: ListView.builder(
                      controller: _scrollControllerCardsChildrens,
                      itemCount: cardsChildres[index].length,
                      itemBuilder: (_, i) => _buildCardTask(index, i),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCardTask(int index, int i) {
    return Container(
      width: 300.0,
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
                blurRadius: 8,
                offset: Offset(0, 0),
                color: Color.fromRGBO(127, 140, 141, 0.5),
                spreadRadius: 1)
          ],
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
        ),
        child: Text(cardsChildres[index][i]),
      ),
    );
  }
}
