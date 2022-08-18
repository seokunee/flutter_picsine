import 'package:flutter/material.dart';
import 'package:flutter_piscine/custum_widget/blur_image.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'my_widget',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const SafeArea(
        child: BlurImage(
            bannerURL:
                "https://w.namu.la/s/420422c9668360c3654fb8d4ba4b4921a22a8732d660e08d81cfa5281035aae6573a4f61927aaeecdcf6ee911af6ea5a4aa49bef54be3f63ada78ac5f914e1cfb4b78e644e2190944fb886f2688ffb91",
            imageURL:
                "https://occ-0-2794-3997.1.nflxso.net/dnm/api/v6/6AYY37jfdO6hpXcMjf9Yu5cnmO0/AAAABW2vHT_kRiIFO3spVWZwdWkXcxqJNrqkwN9mRw8q-yiY0hi3ho64Ce5nh3QXG4F5oaEZUDNYCWK8y-aKlaUMEsTmOd3mOZwIfvEQ.jpg"),
      ),
    );
  }
}
