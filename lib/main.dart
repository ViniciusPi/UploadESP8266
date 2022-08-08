import 'package:esp8266_firebase/views/primeira_view.dart';
import 'package:esp8266_firebase/views/segunda_view.dart';
import 'package:fluent_ui/fluent_ui.dart';

void main(List<String> args) {
  runApp(EspTeste());
}

class EspTeste extends StatefulWidget {
  const EspTeste({Key? key}) : super(key: key);

  @override
  State<EspTeste> createState() => _EspTesteState();
}

class _EspTesteState extends State<EspTeste> {
  @override
  Widget build(BuildContext context) {
    return FluentApp(
      debugShowCheckedModeBanner: false,
      color: Colors.yellow,
      home: homepage(),
    );
  }
}

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationView(
      pane: NavigationPane(
        items: [
          PaneItem(
            icon: Icon(FluentIcons.home),
            title: Text('Primeira pagina'),
          ),
          PaneItem(
            icon: Icon(FluentIcons.accounts),
            title: Text('Segunda pagina'),
          ),
        ],
        onChanged: ((pagina_atual) {
          setState(() {
            index = pagina_atual;
          });
        }),
        selected: index,
      ),
      content: NavigationBody(
        children: [
          SegundaView(),
          PrimeiraView(),
        ],
        index: index,
      ),
    );
  }
}
