import 'dart:convert';

import 'package:flutter/services.dart' as rootBundle;

class CitiesDataModel {
  String? city, country, stateUT;
  String? lat, lng;
  CitiesDataModel({this.city, this.country, this.lat, this.lng, this.stateUT});
  CitiesDataModel.fromJson(Map<String, dynamic> cities) {
    city = cities['city'];
    country = cities['country'];
    stateUT = cities['admin_name'];
    lat = cities['lat'];
    lng = cities['lng'];
  }
}

class Cities {
  final String city;
  final String lat;
  final String lng;
  final String country;
  final String iso2;
  final String adminName;
  final String capital;
  final String population;
  final String populationProper;

  const Cities(
      {required this.city,
      required this.lat,
      required this.lng,
      required this.country,
      required this.iso2,
      required this.adminName,
      required this.capital,
      required this.population,
      required this.populationProper});

  factory Cities.fromJson(Map<String, dynamic> json) {
    return Cities(
        city: json['city'],
        lat: json['lat'],
        lng: json['city'],
        country: json['country'],
        iso2: json['iso2'],
        adminName: json['admin_name'],
        capital: json['capital'],
        population: json['population'],
        populationProper: json['population_proper']);
    // city = json['city'];
    // lat = json['lat'];
    // lng = json['lng'];
    // country = json['country'];
    // iso2 = json['iso2'];
    // adminName = json['admin_name'];
    // capital = json['capital'];
    // population = json['population'];
    // populationProper = json['population_proper'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['city'] = city;
  //   data['lat'] = lat;
  //   data['lng'] = lng;
  //   data['country'] = country;
  //   data['iso2'] = iso2;
  //   data['admin_name'] = adminName;
  //   data['capital'] = capital;
  //   data['population'] = population;
  //   data['population_proper'] = populationProper;
  //   return data;
  // }
}

