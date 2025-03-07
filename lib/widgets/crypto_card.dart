import 'package:flutter/material.dart';
import '../models/crypto_model.dart';

class CryptoCard extends StatelessWidget {
  final Crypto crypto;

  CryptoCard({required this.crypto});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 3,
      child: ListTile(
        leading: Icon(Icons.currency_bitcoin, color: Colors.orange),
        title: Text(
          crypto.name,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          "Rp ${crypto.price.toStringAsFixed(0)}",
          style: TextStyle(fontSize: 16, color: Colors.green),
        ),
      ),
    );
  }
}
