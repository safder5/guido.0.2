// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:guido/selectionpage.dart';

// class Streambuilding extends StatelessWidget {
//   static CollectionReference<Map<String, dynamic>> getStream() =>
//       FirebaseFirestore.instance.collection('customerdata');
//   const Streambuilding({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<QuerySnapshot>(
//       stream: getStream(),
//       builder: (context, customerdata) {
//         if (customerdata.hasError) {
//           print('error');
//         }
//         if (customerdata.hasData) {
//           final data = customerdata.data;
//           if (data != null) {
//             return ListView.builder(
//               itemExtent: 80,
//               itemCount: data.docs.length,
//               itemBuilder: ((context, index) => CustomerData(data.docs[index])),
//             );
//           } else {
//             print('error2');
//           }
//         }
//         return const Center(
//           child: Text('i dont know why its here'),
//         );
//       },
//     );
//   }
// }

// class CustomerData extends StatelessWidget {
//   final String name;
//   final String age;
//   final String address;
//   final QueryDocumentSnapshot _snapshot;
//   CustomerData(this._snapshot)
//       : name = _snapshot.get('name') as String,
//         age = _snapshot.get('age') as String,
//         address = _snapshot.get('address')as String ;

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
