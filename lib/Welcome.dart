import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Welcome extends StatefulWidget {
  @override
  _Welcome createState() {
    return _Welcome();
  }
}

class _Welcome extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      new StreamBuilder(
          stream: Firestore.instance
              .collection('welcome')
              .document('jamesinfo')
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return new Text("Loading");
            }
            var userDocument = snapshot.data;
            final name = userDocument["name"];
            final pet = userDocument["pet"];
            final goal = userDocument["goal"];
            return new Text(
                'hi ${name}, it is time to get to work now on your goal of "${goal}" or ${pet} will die of starvation');
          }),
      _habitBody(context),
    ]);
  }

  Widget _habitBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('new_habit').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();

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
          // trailing: Text(record.votes.toString()),
          // onTap: () =>
          //     record.reference.updateData({'votes': FieldValue.increment(1)}),
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
