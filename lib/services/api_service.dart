import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toonflix4/model/weebtoon_model.dart';

class ApiService {
  static const String _baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String _today = "today";

  Future<List<WebtoonModel>> getTodaysToons() async {
    final url = Uri.parse('$_baseUrl/$_today');
    final response = await http.post(url);
    if (response.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(response.body);
      List<WebtoonModel> webtoonInstances = [];
      for (var webtoon in webtoons) {
        webtoonInstances.add(WebtoonModel.fromJson(webtoon));
      }

      return webtoonInstances;
    }
    throw Error();
  }
}
