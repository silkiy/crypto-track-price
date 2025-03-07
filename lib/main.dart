import 'package:crypto_track/screens/crypto_price_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(CryptoApp());
}

class CryptoApp extends StatelessWidget {
  const CryptoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: CryptoPriceScreen(),
    );
  }
}
