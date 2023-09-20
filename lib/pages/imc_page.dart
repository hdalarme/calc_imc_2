import 'package:calc_imc_2/model/imc.dart';
import 'package:calc_imc_2/repositories/imc_repository.dart';
import 'package:calc_imc_2/shared/widgets/text_label.dart';
import 'package:flutter/material.dart';

class IMCPage extends StatefulWidget {
  const IMCPage({Key? key}) : super(key: key);

  @override
  State<IMCPage> createState() => _IMCPageState();
}

class _IMCPageState extends State<IMCPage> {
  var nomeController = TextEditingController(text: "");
  var pesoController = TextEditingController(text: "");
  var alturaController = TextEditingController(text: "");

  var imcRepository = IMCRepository();
  // ignore: non_constant_identifier_names
  var _IMCs = const <IMC>[];

  bool salvando = false;

  @override
  void initState() {
    super.initState();
    obterIMCs();
  }

  void obterIMCs() async {
    _IMCs = await imcRepository.listar();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: salvando
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  const TextLabel(texto: "Nome"),
                  TextField(
                    controller: nomeController,
                  ),
                  const TextLabel(texto: "Peso"),
                  TextField(
                    controller: pesoController,
                    keyboardType: TextInputType.number,
                  ),
                  const TextLabel(texto: "Altura"),
                  TextField(
                    controller: alturaController,
                    keyboardType: TextInputType.number,
                  ),
                  TextButton(
                    onPressed: () async {
                      setState(() {
                        salvando = false;
                      });
                      if (nomeController.text.trim().length < 3) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("O nome deve ser preenchido")));
                        return;
                      }
                      if (pesoController.text.trim().isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("O peso deve ser preenchido")));
                        return;
                      }
                      if (alturaController.text.trim().isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("A altura deve ser preenchido")));
                        return;
                      }

                      setState(() {
                        salvando = true;
                      });

                      await imcRepository
                          .adicinar(IMC(nomeController.text, pesoController.text, alturaController.text));

                      Future.delayed(const Duration(seconds: 3), () {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Dados salvo com sucesso")));
                        setState(() {
                          salvando = false;
                        });
                        nomeController.text = '';
                        pesoController.text = '';
                        alturaController.text = '';
                        // ignore: use_build_context_synchronously
                        //Navigator.pop(context);
                        //setState(() {});
                      });
                    },
                    child: const Text("Salvar"),
                  ),
                  const Text(
                    "Lista de IMCs Calculados",
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(
                  height: 15,
                ),
                  Expanded(
                      child: ListView.builder(
                          itemCount: _IMCs.length,
                          itemBuilder: (BuildContext bc, int index) {
                            var imc = _IMCs[index];
                            return Dismissible(
                                onDismissed:
                                    (DismissDirection dismissDirection) async {
                                  await imcRepository.remove(imc.id as String);
                                  obterIMCs();
                                },
                                key: Key(imc.id as String),
                                child: ListTile(
                                  title: Text(imc.nome + imc.calcImc(imc)),
                                ));
                          }))
                ],
              ),
      ),
    );
  }
}


/* 
ListView.builder(
                        itemCount: _IMCs.length,
                        itemBuilder: (BuildContext bc, int index) {
                          
                        }
                      )
*/