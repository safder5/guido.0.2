import 'dart:convert';
import 'dart:core';

class User {
  final String sender;
  final String uid;
  final String about;
  final String work;
  final String location;
  final String language;
  final DateTime dob;
  final String contact;
  final String name;

  User({
    required this.about,
    required this.sender,
    required this.location,
    required this.language,
    required this.uid,
    required this.work,
    required this.dob,
    required this.contact,
    required this.name,
  });

  // User.fromJson(Map<String, dynamic> json):

  Map<String, dynamic> toJsons() => {
        'name': name,
        'uid': uid,
        'about': about,
        'address': location,
        'age': dob,
        'contact': contact,
        'language': language,
        'sender': sender,
        'work': work,
      };
}

