import 'collection.dart';
import 'self.dart';
import 'up.dart';

class Links {
  List<Self>? self;
  List<Collection>? collection;
  List<Up>? up;

  Links({this.self, this.collection, this.up});

  factory Links.fromJsonData(Map<String, dynamic> json) => Links(
        self: (json['self'] as List<dynamic>?)
            ?.map((e) => Self.fromJsonData(e as Map<String, dynamic>))
            .toList(),
        collection: (json['collection'] as List<dynamic>?)
            ?.map((e) => Collection.fromJsonData(e as Map<String, dynamic>))
            .toList(),
        up: (json['up'] as List<dynamic>?)
            ?.map((e) => Up.fromJsonData(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJsonData() => {
        'self': self?.map((e) => e.toJsonData()).toList(),
        'collection': collection?.map((e) => e.toJsonData()).toList(),
        'up': up?.map((e) => e.toJsonData()).toList(),
      };
}
