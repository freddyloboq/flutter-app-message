// class YesNotModel {
//   String answer;
//   bool forced;
//   String image;

//   YesNotModel({
//     required this.answer,
//     required this.forced,
//     required this.image,
//   });

//   factory YesNotModel.fromJsonMap(Map<String, dynamic> json) =>
//     YesNotModel(
//         answer: json['answer'],
//         forced: json['forced'],
//         image: json['image'],
//       );
// }


// To parse this JSON data, do
//
//     final yesNotModel = yesNotModelFromJson(jsonString);



// Respuesta de quickType.io
import 'package:yer_no_app/domain/entities/message.dart';

class YesNotModel {
  final String answer;
  final bool forced;
  final String image;

  YesNotModel({
    required this.answer,
    required this.forced,
    required this.image,
  });

  factory YesNotModel.fromJsonMap(Map<String, dynamic> json) => YesNotModel(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "answer": answer,
        "forced": forced,
        "image": image,
      };

      Message toMessageEntity() => Message(
        text: answer == 'yes' ? 'Si' : 'No',
        fromWho: FromWho.he,
        imageUrl: image,
      );
}
