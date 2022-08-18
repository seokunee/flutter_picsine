import 'package:flutter/material.dart';

class BlurImage extends StatelessWidget {
  const BlurImage({Key? key, required this.bannerURL, required this.imageURL})
      : super(key: key);

  // 1. 위젯간의 데이터를 전달할때는 다음과 같이 파라미터, 필드들을 final형태로 구성하고
  final String bannerURL;
  final String imageURL;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      backgroundColor: Colors.black,
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.black,
    );
  }

  Center _buildBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.network(
            bannerURL,
          ),
          Center(
            child: Stack(children: [
              Container(
                foregroundDecoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black,
                      Colors.transparent,
                      Colors.transparent,
                      Colors.black
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0, 0.33, 0.66, 1],
                  ),
                ),
                child: AspectRatio(
                  aspectRatio: 1.0 / 1.0,
                  child: Image.network(imageURL, fit: BoxFit.fill),
                ),
              ),
              Column(children: const <Widget>[
                SizedBox(
                  height: 80,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    '456억',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey,
                    ),
                    // textAlign: TextAlign.center,
                  ),
                ),
                Align(
                  child: Text(
                    '어  른  들  의   동  심  이   파  괴  된  다.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                )
              ]),
            ]),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Title: Squid Game 2021",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
              Text(
                "Eepisode: 1",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
              Text(
                "Plot : Hundreds of cash-strapped players accept a strange invitation to compete in children's games. Inside, a tempting prize awaits with deadly high stakes. A survival game that has a whopping 45.6 billion-won prize at stake.",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
