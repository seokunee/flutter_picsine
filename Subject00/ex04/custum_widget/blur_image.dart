import 'package:flutter/material.dart';

class PoketmonDetails extends StatelessWidget {
  final String poketmonImageURL;

  const PoketmonDetails({Key? key, required this.poketmonImageURL})
      : super(key: key);

  final TextStyle titleTextStyle =
      const TextStyle(color: Colors.white, fontSize: 20);
  final TextStyle infoTextStyle = const TextStyle(
      color: Colors.white, fontSize: 40, fontWeight: FontWeight.w400);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffFDDF81),
        appBar: _buildAppBar(),
        body: _buildBody());
  }

  _buildAppBar() {
    return AppBar(
        backgroundColor: const Color(0xffFFC826),
        title: const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'My Poket',
            textAlign: TextAlign.start,
          ),
        ));
  }

  _buildBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: CircleAvatar(
                radius: 100.0,
                backgroundImage: NetworkImage(
                  poketmonImageURL,
                )),
          ),
          const Divider(
            height: 30,
            thickness: 1,
            indent: 40,
            endIndent: 40,
            color: Colors.grey,
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: 300,
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Name",
                  style: titleTextStyle,
                ),
                Text(
                  "Pikachu",
                  style: infoTextStyle,
                ),
                Text(
                  "Level",
                  style: titleTextStyle,
                ),
                Text(
                  "Lv.4",
                  style: infoTextStyle,
                ),
                const SizedBox(
                  height: 15,
                ),
                const PoketmonSkillText(
                  skillName: "Body Blow",
                ),
                const PoketmonSkillText(
                  skillName: "Electric Shocks",
                ),
                const PoketmonSkillText(
                  skillName: "Electro Ball",
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class PoketmonSkillText extends StatelessWidget {
  const PoketmonSkillText({Key? key, required this.skillName})
      : super(key: key);

  final String skillName;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(
          Icons.check_circle_outline,
          color: Colors.black,
          size: 18.0,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          skillName,
          textAlign: TextAlign.justify,
          style: const TextStyle(
              color: Colors.black, fontSize: 13, fontWeight: FontWeight.w300),
        ),
      ],
    );
  }
}
