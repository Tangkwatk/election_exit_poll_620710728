import 'package:election_exit_poll_620710728/models/candidate_item.dart';
import 'package:election_exit_poll_620710728/services/api.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: const DecorationImage(
            image: const AssetImage("assets/images/bg.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      "assets/images/vote_hand.png",
                      height: 120.0,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "EXIT POLL",
                        style: TextStyle(fontSize: 30.0, color: Colors.white60),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Text('เลือกตั้ง อบต.',
                      style: TextStyle(fontSize: 20.0, color: Colors.white)),
                  Text('รายชื่อผู้สมัครรับเลือกตั้ง',
                      style: TextStyle(fontSize: 20.0, color: Colors.white)),
                  Text('นายกองค์การบริหารส่วนตำบลเขาพระ',
                      style: TextStyle(fontSize: 20.0, color: Colors.white)),
                  Text('อำเภอเมืองนครนายก จังหวัดนครนายก',
                      style: TextStyle(fontSize: 20.0, color: Colors.white)),
                ],
              ),
              ListTile(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red, // background
                    onPrimary: Colors.white, // foreground
                  ),
                  onPressed: () {},
                  child: Text(
                    'ดูผล',
                    style: TextStyle(fontSize: 25.0),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

_fetchFoods() async {
  try {
    var list = (await Api().fetch('exit_poll')) as List<dynamic>;
    var CList = list
        .map((item) =>CandidateItem.fromJson(item)).toList();
    print('Number of c: ${CList.length}');
  } catch (e) {
    var msg = 'ERROR: $e';
    print(msg);
  }
}
