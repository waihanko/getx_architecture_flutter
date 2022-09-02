import '../../../data_models/responses/dummy_list_response.dart';

class SampleMapper {
  final List<Data>? list;

  List<SampleVO> get getMapList => list!
      .map(
        (e) => SampleVO(id: e.id!, title: e.name!),
      )
      .toList();

  SampleMapper({this.list}); // final int? id;

}

class SampleVO {
  final String title;
  final int id;

  SampleVO({required this.title, required this.id});

  String? get mapTitle =>
      "${title.substring(title.length - 1, title.length)} Han Gyi ";
}
