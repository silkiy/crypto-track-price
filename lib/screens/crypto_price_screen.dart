import 'package:flutter/material.dart';
import '../services/crypto_service.dart';
import '../models/crypto_model.dart';
import '../widgets/crypto_card.dart';

class CryptoPriceScreen extends StatefulWidget {
  const CryptoPriceScreen({super.key});

  @override
  _CryptoPriceScreenState createState() => _CryptoPriceScreenState();
}

class _CryptoPriceScreenState extends State<CryptoPriceScreen> {
  late Future<List<Crypto>> cryptoPrices;

  @override
  void initState() {
    super.initState();
    cryptoPrices = CryptoService.fetchCryptoPrices();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Harga Crypto (IDR)")),
      body: FutureBuilder<List<Crypto>>(
        future: cryptoPrices,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Gagal memuat data"));
          } else {
            final cryptos = snapshot.data!;
            return ListView.builder(
              itemCount: cryptos.length,
              itemBuilder: (context, index) {
                return CryptoCard(crypto: cryptos[index]);
              },
            );
          }
        },
      ),
    );
  }
}
