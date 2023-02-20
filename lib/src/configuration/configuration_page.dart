import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:listinha/src/shared/stores/app_store.dart';

class ConfigurationPage extends StatefulWidget {
  const ConfigurationPage({super.key});

  @override
  State<ConfigurationPage> createState() => _ConfigurationPageState();
}

class _ConfigurationPageState extends State<ConfigurationPage> {
  @override
  Widget build(BuildContext context) {
    final appStore = context.watch<AppStore>((store) => store.themeMode);

    return Scaffold(
      appBar: AppBar(
        title: const Text('LISTINHA'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Configurações', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 20),
            Text('Tema', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 10),
            RadioListTile<ThemeMode>(
              value: ThemeMode.system,
              title: const Text('Sistema'),
              groupValue: appStore.themeMode.value,
              onChanged: appStore.changeThemeMode,
            ),
            RadioListTile<ThemeMode>(
              value: ThemeMode.light,
              title: const Text('Claro'),
              groupValue: appStore.themeMode.value,
              onChanged: appStore.changeThemeMode,
            ),
            RadioListTile<ThemeMode>(
              value: ThemeMode.dark,
              title: const Text('Escuro'),
              groupValue: appStore.themeMode.value,
              onChanged: appStore.changeThemeMode,
            ),
            const SizedBox(height: 20),
            Text('Controle de dados', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 10),
            OutlinedButton(
              onPressed: appStore.deleteApp,
              child: const Text('Apagar cache e reiniciar o app'),
            )
          ],
        ),
      ),
    );
  }
}
