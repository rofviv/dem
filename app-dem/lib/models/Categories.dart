import 'package:app_dem/models/Types.dart';

class Categories {
  int id;
  String title;
  List<Types> sub;
  String img;

  Categories({ this.id, this.title, this.sub, this.img });
}