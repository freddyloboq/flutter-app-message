import 'package:dio/dio.dart';
import 'package:yer_no_app/config/infraestructure/models/yes_not_model.dart';
import 'package:yer_no_app/domain/entities/message.dart';

class GetYesNotAnswer {
  final _dio = Dio();

  Future<Message> getAnswer() async {
    final response = await _dio.get('https://yesno.wtf/api');

    // if (response.statusCode == 200) {
    //   final message = Message.fromJson(response.data);
    //   return message;
    // }

    final yesNotModel = YesNotModel.fromJsonMap(response.data);

    // return Message(
    //   text: yesNotModel.answer,
    //   fromWho: FromWho.he,
    //   imageUrl: yesNotModel.image,
    // );

    return yesNotModel.toMessageEntity();
    // throw UnimplementedError();
  }
}
