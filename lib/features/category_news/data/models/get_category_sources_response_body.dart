import 'source_model.dart';

class GetCategorySourcesResponseBody {
  GetCategorySourcesResponseBody({
    required this.status,
    required this.sources,
  });

  final String? status;
  final List<SourceModel> sources;

  factory GetCategorySourcesResponseBody.fromJson(Map<String, dynamic> json) {
    return GetCategorySourcesResponseBody(
      status: json["status"],
      sources: json["sources"] == null
          ? []
          : List<SourceModel>.from(
              json["sources"]!.map((x) => SourceModel.fromJson(x))),
    );
  }
}

