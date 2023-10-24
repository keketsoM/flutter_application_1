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
          'https://media.takealot.com/covers_images/0a20ae1b995f4ee8a5ccfbcfc8621218/s-zoom.file',
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
      name: "Laptops",
      imageUrl:
          'https://media.takealot.com/covers_images/129d0967c13a469fad090debcf27b690/s-zoom.file',
    ),
    const Category(
      name: "Watch",
      imageUrl:
          'https://media.takealot.com/covers_images/20ae31c6175b4016a63757b07caf8367/s-zoom.file',
    )
  ];
}
