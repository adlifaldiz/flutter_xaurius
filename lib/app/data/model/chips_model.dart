import 'package:flutter/foundation.dart';

class ChipsModel {
  int id;
  String name;

  ChipsModel(this.id, this.name);

  int get getId => this.id;

  set setId(int id) => this.id = id;

  get getName => this.name;

  set setName(name) => this.name = name;
}
