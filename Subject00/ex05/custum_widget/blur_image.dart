import 'package:flutter/material.dart';

class PoketmonDetail extends StatefulWidget {
  const PoketmonDetail({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PoketmonDetailState();
}

class _PoketmonDetailState extends State<PoketmonDetail> {
  int _currentIndex = 0;

  final List<Widget> _children = const [
    PoketmonDetaiilBody(
        imageURL:
            "https://mblogthumb-phinf.pstatic.net/MjAxNzAyMjVfMjMg/MDAxNDg3OTUzMTI3Mzc0._tG2RA_tY9IZcrw10kWz3YfLkhcuSRxm_rUQoLRhsQEg.hndrmcX4b8HI5c_EJB_JfftjG6C79zJXLQ0g6dZy9FQg.GIF.doghter4our/IMG_3900.GIF?type=w800",
        name: "Pikachu",
        level: "Lv.4"),
    PoketmonDetaiilBody(
        imageURL:
            "https://file3.instiz.net/data/file3/2018/08/14/d/7/b/d7b25d5d584d77103901068ed3844b9d.gif",
        name: "Caterpie",
        level: "Lv.2")
  ];
  final List<Color> _appbarColors = const [
    Color(0xffFFC826),
    Color(0xff65BC69)
  ];
  final List<Color> _bodyColors = const [Color(0xffFDDF81), Color(0xff4AAF50)];

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final TextStyle titleTextStyle =
      const TextStyle(color: Colors.white, fontSize: 20);
  final TextStyle infoTextStyle = const TextStyle(
      color: Colors.white, fontSize: 40, fontWeight: FontWeight.w400);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bodyColors[_currentIndex],
      appBar: _buildAppBar(_appbarColors[_currentIndex]),
      body: _children[_currentIndex],
      drawer: _buildDrawer(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: const [
          UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(
                    "https://image.fmkorea.com/files/attach/new/20200107/486616/1357078042/2578673714/150bade13507e98fbdc93f13e6b858fd.png"),
              ),
              accountName: Text("seokchoi"),
              accountEmail: Text("seokchoi@poketmonmaster.com"),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    stops: [
                      0.1,
                      0.9,
                    ],
                    colors: [Colors.red, Colors.blue],
                  ),
                  color: Colors.grey,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40.0),
                      bottomRight: Radius.circular(40.0)))),
          ListTile(
            leading: Icon(
              Icons.add_box_outlined,
              color: Colors.black54,
            ),
            title: Text("Poketmon Center"),
          ),
          ListTile(
            leading: Icon(
              Icons.support_agent,
              color: Colors.black54,
            ),
            title: Text("Support"),
          ),
          ListTile(
            leading: Icon(
              Icons.logout,
              color: Colors.black54,
            ),
            title: Text("Logout"),
          )
        ],
      ),
    );
  }

  _buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      onTap: _onTap,
      currentIndex: _currentIndex,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          label: "",
          icon: Icon(Icons.electric_bolt_sharp),
        ),
        BottomNavigationBarItem(
          label: "",
          icon: Icon(Icons.grass),
        ),
      ],
      selectedItemColor: Colors.amber[800],
    );
  }

  _buildAppBar(Color color) {
    return AppBar(
        backgroundColor: color,
        title: const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'My Poket',
            textAlign: TextAlign.start,
          ),
        ));
  }
}

class PoketmonDetaiilBody extends StatelessWidget {
  final String imageURL;
  final String name;
  final String level;
  const PoketmonDetaiilBody(
      {Key? key,
      required this.imageURL,
      required this.name,
      required this.level})
      : super(key: key);

  final TextStyle titleTextStyle =
      const TextStyle(color: Colors.white, fontSize: 20);
  final TextStyle infoTextStyle = const TextStyle(
      color: Colors.white, fontSize: 40, fontWeight: FontWeight.w400);

  @override
  Widget build(BuildContext context) {
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
                  imageURL,
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
                  name,
                  style: infoTextStyle,
                ),
                Text(
                  "Level",
                  style: titleTextStyle,
                ),
                Text(
                  level,
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
