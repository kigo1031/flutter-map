import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:toonflix4/model/weebtoon_model.dart';

import 'package:toonflix4/scroll/custom_scroll_physics.dart';
import 'package:toonflix4/services/api_service.dart';
import 'package:toonflix4/widget/weboon_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<WebtoonModel>> webtoons = ApiService().getTodaysToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        title: const Center(
          child: Text(
            "오늘의 웹툰",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
      body: FutureBuilder(
        future: webtoons,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Expanded(child: makeList(snapshot)),
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(
              strokeWidth: 5,
            ),
          );
        },
      ),
    );
  }

  ListView makeList(AsyncSnapshot<List<WebtoonModel>> snapshot) {
    return ListView.separated(
      physics: const CustomScrollPhysics(),
      padding:
          const EdgeInsetsDirectional.symmetric(horizontal: 30, vertical: 10),
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) {
        // print(index);
        var webtoon = snapshot.data![index];
        return WebtoonWidget(webtoon: webtoon);
      },
      separatorBuilder: (context, index) => const SizedBox(width: 40),
    );
  }

  Future<Position> getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    return position;
  }
}
