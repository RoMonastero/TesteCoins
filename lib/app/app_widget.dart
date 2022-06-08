import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'modules/home_page.dart';
import 'services/criptomoedas_service.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CriptomoedasService>(
            create: (_) => CriptomoedasService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Teste Coins',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}
