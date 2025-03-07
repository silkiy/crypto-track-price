import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/crypto_model.dart';

class CryptoService {
  static const String apiUrl = "https://api.coingecko.com/api/v3/simple/price";
  static const List<String> cryptoList = [
    "bitcoin",
    "ethereum",
    "binancecoin",
    "tether",
  ];

  static Future<List<Crypto>> fetchCryptoPrices() async {
    final String ids = cryptoList.join(',');
    final String url = "$apiUrl?ids=$ids&vs_currencies=idr";

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return cryptoList
          .map((coin) => Crypto.fromJson(coin, data[coin]))
          .toList();
    } else {
      throw Exception("Gagal mengambil data harga crypto");
    }
  }
}
