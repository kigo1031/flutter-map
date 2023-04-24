import 'package:flutter/material.dart';
import 'package:toonflix4/model/weebtoon_model.dart';
import 'package:toonflix4/screen/webtoon_detail_screen.dart';

class WebtoonWidget extends StatelessWidget {
  const WebtoonWidget({
    super.key,
    required this.webtoon,
  });

  final WebtoonModel webtoon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const WeebtoonDetailScreen(
              WebtoonModel: WebtoonModel,
            ),
          ),
        );
      },
      child: Column(
        children: [
          Container(
            width: 230,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  blurRadius: 8,
                  color: Colors.black.withOpacity(0.5),
                  offset: const Offset(10, 10),
                )
              ],
            ),
            child: Image.network(
              webtoon.thumb,
              headers: const {
                "User-Agent":
                    "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            webtoon.title,
            style: const TextStyle(
              fontSize: 22,
            ),
          ),
        ],
      ),
    );
  }
}
