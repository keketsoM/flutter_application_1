import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final String category;
  final String description;
  final String imageUrl;
  final double price;
  final int discount;
  final bool isPopular;
  final bool isRecommended;

  Product(
      {required this.name,
      required this.category,
      required this.description,
      required this.imageUrl,
      required this.price,
      required this.isPopular,
      required this.isRecommended,
      required this.discount});
  @override
  // TODO: implement props
  List<Object?> get props => [
        name,
        category,
        description,
        imageUrl,
        isPopular,
        price,
        isRecommended,
        discount,
      ];

  static List<Product> products = [
    Product(
        name: 'Huawei Matebook\n D14',
        category: 'Laptop',
        imageUrl:
            'https://thefoschini.vtexassets.com/arquivos/ids/86967229-800-800?v=638305309298800000&width=800&height=800&aspect=true',
        price: 13999.0,
        isPopular: true,
        isRecommended: true,
        description:
            'Enjoy every look of HUAWEI MateBook D 14 thanks to the IPS anti-glare 14" HUAWEI FullView Display1 and 16:9 aspect ratio. With Full-HD 1920 × 1080 resolution, every image bursts with detail and clarity. For a better viewing experience every time you open up. Enjoy every look of HUAWEI MateBook D 14 thanks to the IPS anti-glare 14" HUAWEI FullView Display1 and 16:9 aspect ratio. With Full-HD 1920 × 1080 resolution, every image bursts with detail and clarity. For a better viewing experience every time you open up.',
        discount: 20),
    Product(
        name: 'Acer Nitro 5',
        category: 'Laptop',
        imageUrl:
            'https://thefoschini.vtexassets.com/arquivos/ids/86952729-800-800?v=638305255463600000&width=800&height=800&aspect=true',
        price: 23999.0,
        isPopular: false,
        isRecommended: true,
        description:
            'Power. Performance. Playtime! Hit Turbo and go full speed. Reign over the gaming world with the latest processors giving you superior gaming performance while delivering flexibility to multitask. Explore games in greater detail with a range of resolutions high-speed displays.Web Browsing, Access to banking services, Education and Studying, Business Meeting, Marketing, Companies, Gaming, Data Storage, Searching Jobs, browsing through social media, Sending & Receiving Emails.',
        discount: 79),
    Product(
        name: 'Lenovo Legion 5 ',
        category: 'Laptop',
        imageUrl:
            'https://thefoschini.vtexassets.com/arquivos/ids/82023812-800-800?v=638295957559370000&width=800&height=800&aspect=true',
        price: 38999.0,
        isPopular: true,
        isRecommended: true,
        description:
            'With revolutionary performance and efficiency cores, 12th Gen Intel® Core™ processors enable seamless streaming, editing, gaming, and recording, delivering responsiveness where you need it most. Intel® Thread Director and up to Intel® WiFi 6E support keep everything lag-free. At the same time, Intel® Turbo Boost Technology boosts framerate in peak loads, so nothing slows you down. *6GHz WiFi 6E operation is dependent on the support of the operating system, routers/APs/gateways that support WiFi 6E, along with the regional regulatory certifications and spectrum allocation.',
        discount: 44),
    Product(
        name: 'Lenovo Yoga\nSlim 7 Pro',
        category: 'Laptop',
        imageUrl:
            'https://thefoschini.vtexassets.com/arquivos/ids/87027750-800-800?v=638305581928770000&width=800&height=800&aspect=true',
        price: 38999.0,
        isPopular: true,
        isRecommended: true,
        description:
            'Be free to perform anywhere with up to Intel® Evo™, featuring 12th Gen Intel® Core™ H Series Processors, distributing performance where you need it most. And with Lenovo X Power, the Yoga Slim 7i Pro X lets you leverage specific scenario tuning to push beyond benchmarks, turbo matrix optimizations for maximum CPU and GPU performance, and fine-tuned industry-leading hardware.',
        discount: 54),
    Product(
        name: 'Acer Aspire i3',
        category: 'Laptop',
        imageUrl:
            'https://thefoschini.vtexassets.com/arquivos/ids/82049338-800-800?v=638295967866570000&width=800&height=800&aspect=true',
        price: 13999.0,
        isPopular: true,
        isRecommended: true,
        description:
            'The Acer Aspire 5 is a core i3 and comes with 8GB RAM and 256GB SSD Allows for smoother browsing of the internet as well as creates an easier way to complete daily tasks such as sending emails. 14 inch Display Windows Home 10256Gb SSD / 8GB Ram Intel® CoreTM i3-1115G4 processor',
        discount: 25),
  ];
}
