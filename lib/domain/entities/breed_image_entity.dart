import 'dart:convert';



List<BreedImagesEntity> breedImagesEntityFromJson(String str) => List<BreedImagesEntity>.from(json.decode(str).map((x) => BreedImagesEntity.fromJson(x)));
String breedImagesEntityToJson(List<BreedImagesEntity> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BreedImagesEntity {
    final String id;
    final String url;
    final int width;
    final int height;

    BreedImagesEntity({
        required this.id,
        required this.url,
        required this.width,
        required this.height,
    });

    factory BreedImagesEntity.fromJson(Map<String, dynamic> json) => BreedImagesEntity(
        id: json["id"],
        url: json["url"],
        width: json["width"],
        height: json["height"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "width": width,
        "height": height,
    };
}