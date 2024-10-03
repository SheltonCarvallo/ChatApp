// by hand
/* class YesNoModel {
  String answer;
  bool forced;
  String gifUrl;

  YesNoModel(
      {required this.answer,
       required this.forced,
       required this.gifUrl});

  factory YesNoModel.fromJsonMap(Map<String, dynamic> json) => YesNoModel(
      answer: json['answer'], forced: json['forced'], gifUrl: json['image']);
}
 */

// To parse this JSON data, do
//
//     final yesNoModel = yesNoModelFromJson(jsonString);

//by quickType
import 'package:chat_app/domain/entities/message.dart';

class YesNoModel {
  String answer;
  bool forced;
  String image;

  YesNoModel({
    required this.answer,
    required this.forced,
    required this.image,
  });

  factory YesNoModel.fromJsonMap(Map<String, dynamic> json) => YesNoModel(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "answer": answer,
        "forced": forced,
        "image": image,
      };

  //Maper below
  Message toMessageEntity() => Message(
      text: answer == 'yes' ? 'Yes' : 'No',
      sender: FromWho.its,
      imageUrl: image);
}
