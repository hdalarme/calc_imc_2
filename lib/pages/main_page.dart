import 'package:calc_imc_2/pages/card_page.dart';
import 'package:calc_imc_2/pages/image_assets.dart';
import 'package:calc_imc_2/pages/tarefa_page.dart';
import 'package:flutter/material.dart';
import 'package:calc_imc_2/shared/widgets/custon_drawer.dart';

import 'package:calc_imc_2/pages/list_view.dart';
import 'package:calc_imc_2/pages/list_view_horizontal.dart';
import 'package:calc_imc_2/pages/pagina1.dart';
import 'package:calc_imc_2/pages/pagina2.dart';
import 'package:calc_imc_2/pages/pagina3.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController controller = PageController(initialPage: 0);
  int posicaoPagina = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Main Page"),
      ),
      drawer: const CustonDrawer(),
      /*drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  width: double.infinity,
                  child: const Text("Dados cadastrais"),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DadosCadastraisPage()));
                },
              ),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    width: double.infinity,
                    child: const Text("Termos de uso e privacidade")),
                onTap: () {},
              ),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    width: double.infinity,
                    child: const Text("Configurações")),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),*/
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: controller,
              onPageChanged: (value) {
                setState(() {
                  posicaoPagina = value;
                });
              },
              children: const [
                CardPage(),
                ImageAssetsPage(),
                ListViewPage(),
                ListViewHorizontal(),
                TarefaPage(),
                Pagina1Page(),
                Pagina2Page(),
                Pagina3Page(),
              ],
            ),
          ),
          BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            onTap: (value) {
              controller.jumpToPage(value);
            },
            currentIndex: posicaoPagina,
            items: const [
              BottomNavigationBarItem(label: "Pag1", icon: Icon(Icons.home)),
              BottomNavigationBarItem(label: "Pag2", icon: Icon(Icons.add)),
              BottomNavigationBarItem(label: "Pag3", icon: Icon(Icons.person)),
              BottomNavigationBarItem(label: "Pag3", icon: Icon(Icons.image)),
              BottomNavigationBarItem(label: "Tarefas", icon: Icon(Icons.list)),
            ]
          )
        ],
      ),
    ));
  }
}
