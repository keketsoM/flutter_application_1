import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String name;
  final String imageUrl;

  const Category({
    required this.name,
    required this.imageUrl,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [name, imageUrl];

  static List<Category> categories = [
    const Category(
      name: "Phone",
      imageUrl:
          'https://thefoschini.vtexassets.com/arquivos/ids/91013519-800-800?v=638327268540200000&width=800&height=800&aspect=true',
    ),
    const Category(
      name: "Fragrance",
      imageUrl:
          'https://clicks.co.za/medias/?context=bWFzdGVyfHByb2R1Y3QtaW1hZ2VzfDMwNTM4fGltYWdlL2pwZWd8cHJvZHVjdC1pbWFnZXMvaDc5L2hkMC85NDMxMjgwMzg2MDc4LmpwZ3xhZjc3NGQ0ZDgwZjYzZGMzMTBhNTQyZWFmMmYzZjQzZmMxMDNjMjMxZTI3NmYyNmRjMTVkMTQ0YzViYzJjMDcy',
    ),
    const Category(
      name: "Clothes",
      imageUrl:
          'https://media.takealot.com/covers_images/ace7f49dc08849a89fb33149662eb309/s-zoom.file',
    ),
    const Category(
      name: "Laptop",
      imageUrl:
          'https://media.takealot.com/covers_images/129d0967c13a469fad090debcf27b690/s-zoom.file',
    ),
    const Category(
      name: "Watch",
      imageUrl:
          'https://thefoschini.vtexassets.com/arquivos/ids/68468651-800-800?v=638265768839400000&width=800&height=800&aspect=true',
    )
  ];
}
