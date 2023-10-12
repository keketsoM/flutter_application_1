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
          'https://thefoschini.vtexassets.com/arquivos/ids/86923697-800-800?v=638305159156970000&width=800&height=800&aspect=true',
    ),
    const Category(
      name: "Fragrance",
      imageUrl:
          'https://clicks.co.za/medias/?context=bWFzdGVyfHByb2R1Y3QtaW1hZ2VzfDMwNTM4fGltYWdlL2pwZWd8cHJvZHVjdC1pbWFnZXMvaDc5L2hkMC85NDMxMjgwMzg2MDc4LmpwZ3xhZjc3NGQ0ZDgwZjYzZGMzMTBhNTQyZWFmMmYzZjQzZmMxMDNjMjMxZTI3NmYyNmRjMTVkMTQ0YzViYzJjMDcy',
    ),
    const Category(
      name: "Clothes",
      imageUrl:
          'https://thefoschini.vtexassets.com/arquivos/ids/77624749-800-800?v=638288153067800000&width=800&height=800&aspect=true',
    ),
    const Category(
      name: "Laptop",
      imageUrl:
          'https://thefoschini.vtexassets.com/arquivos/ids/82235033-800-800?v=638296047163970000&width=800&height=800&aspect=true',
    ),
    const Category(
      name: "Watches",
      imageUrl:
          'https://thefoschini.vtexassets.com/arquivos/ids/68468651-800-800?v=638265768839400000&width=800&height=800&aspect=true',
    )
  ];
}
