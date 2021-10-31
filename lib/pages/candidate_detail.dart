import 'package:election_exit_poll_620710728/models/candidate_item.dart';
import 'package:election_exit_poll_620710728/pages/candidate_list.dart';
import 'package:flutter/material.dart';

class candidateDetail extends StatefulWidget {
  const candidateDetail({Key? key}) : super(key: key);
  static const routeName = '/candidate_detail';

  @override
  _candidateDetailState createState() => _candidateDetailState();
}

class _candidateDetailState extends State<candidateDetail> {
  @override
  Widget build(BuildContext context){
    final candidateItem = ModalRoute.of(context)!.settings.arguments as CandidateItem;
    return Scaffold(
      appBar: AppBar(
        title: Text(candidateItem.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),

            ),
  ]
  ),
  ),
    );

}



