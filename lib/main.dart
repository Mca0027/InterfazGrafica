import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'providers/prod_provider.dart';
import 'screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    print("✅ Firebase conectado");
  } catch (e) {
    print("❌ Error en Firebase: $e");
  }

  runApp(
    ChangeNotifierProvider(
      create: (_) => ProductosProvider()..loadProductos(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inventario DAM',
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: LoginScreen(), // Inicia en pantalla de inicio de sesión
    );
  }
}
