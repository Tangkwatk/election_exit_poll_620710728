import 'dart:js';
import 'package:election_exit_poll_620710728/models/candidate_item.dart';
import 'package:election_exit_poll_620710728/pages/candidate_detail.dart';
import 'package:election_exit_poll_620710728/services/api.dart';
import 'package:flutter/material.dart';

class CandidateListPage extends StatefulWidget {
  static const routeName = '/candidate_list_page';
  const CandidateListPage({Key? key}) : super(key: key);

  @override
  _CandidateListPageState createState() => _CandidateListPageState();
}

class _CandidateListPageState extends State<CandidateListPage> {
  late Future<List<CandidateItem>> _futurecandidateList;

  @override
  void initState() {
    super.initState();

    _futurecandidateList = _loadCandidate();
  }

  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<List<CandidateItem>>(
        future: _futurecandidateList,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasData) {
            var candidateList = snapshot.data;
            return ListView.builder(
              padding: EdgeInsets.all(8.0),
              itemCount: candidateList!.length,
              itemBuilder: (BuildContext context, int index) {
                var candidateItem = candidateList[index];

                return Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  margin: EdgeInsets.all(8.0),
                  elevation: 5.0,
                  shadowColor: Colors.black.withOpacity(0.2),
                  child: InkWell(
                    onTap: () => _handleClickCandidateItem(candidateItem),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      candidateItem.name,
                                      style: TextStyle(fontSize: 20.0),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('ผิดพลาด: ${snapshot.error}'),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _futurecandidateList = _loadCandidate();
                        });
                      },
                      child: Text('ลองใหม่')),
                ],
              ),
            );
          }

          return SizedBox.shrink();
        },
      ),
    );
  }

  Future<List<CandidateItem>> _loadCandidate() async {
    List list = await Api().fetch('exit_poll');
    var candidateList =
        list.map((item) => CandidateItem.fromJson(item)).toList();
    return candidateList;
  }

  _handleClickCandidateItem(CandidateItem candidateItem) {
    Navigator.pushNamed(
      context,
      candidateDetail.routeName,
      arguments: candidateItem,
    );
  }
}
