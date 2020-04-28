import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final dummySnapshot = [
  {"habit": "habit 1"},
  {"habit": "habit 2"},
  {"habit": "habit 3"},
  {"habit": "habit 4"},
];

class MyHabits extends StatefulWidget {
  @override
  _MyHabits createState() {
    return _MyHabits();
  }
}

class _MyHabits extends State<MyHabits> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('new_habit').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();
        print(Firestore.instance.collection('new_habit').snapshots());
        return _buildList(context, snapshot.data.documents);
      },
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      padding: const EdgeInsets.only(top: 20.0),
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    final record = Record.fromSnapshot(data);

    return Padding(
      key: ValueKey(record.habit),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: ListTile(
          title: Text(record.habit),
          onTap: () => print(record),
        ),
      ),
    );
  }
}

class Record {
  final String habit;
  final DocumentReference reference;

  Record.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['habit'] != null),
        habit = map['habit'];

  Record.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Record<$habit>";
}
