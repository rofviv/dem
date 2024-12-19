import 'package:app_dem/models/Categories.dart';
import 'package:app_dem/models/Types.dart';

class ListCategories {

  Categories fuego;
  Categories ambulancia;
  Categories rescate;
  List<Categories> list = [];

  ListCategories() {
    this.createAmbulancia();
    this.createFuego();
    this.createRescate();
  }

  void createFuego() {
    Types f1 = Types(id: 101, type: 'Vehicular', description: 'Vehiculo en llamas', img: 'me_time.png');
    Types f2 = Types(id: 101, type: 'Incendio en Vivienda', description: 'Una casa en llamas', img: 'me_time.png');
    Types f3 = Types(id: 101, type: 'Incendio forestal', description: 'Bosque, monte o basura', img: 'me_time.png');
    Types f4 = Types(id: 101, type: 'Olor / Fuga de gas', description: 'Posible explosion', img: 'me_time.png');
    List<Types> _lstFuego = [ f1, f2, f3, f4 ];
    this.fuego = Categories(id: 1, title: 'Fuego', sub: _lstFuego, img: 'bombero.png');
    this.list.add(this.fuego);
  }

  void createAmbulancia() {
    Types a1 = Types(id: 101, type: 'Desmayo', description: 'Perdida de conocimiento', img: 'team_time.png');
    Types a2 = Types(id: 101, type: 'Infarto', description: 'Dolor de pecho', img: 'team_time.png');
    Types a3 = Types(id: 101, type: 'Paralisis', description: 'Dolor de cabeza', img: 'team_time.png');
    List<Types> _lstambulancia = [ a1, a2, a3 ];
    this.ambulancia = Categories(id: 1, title: 'Ambulancia', sub: _lstambulancia, img: 'ambulancia.png');
    this.list.add(this.ambulancia);
  }

  void createRescate() {
    Types _rescateTypes = Types(id: 101, type: 'Hombre atrapado', description: 'Hombre atrapado', img: 'lovely_time.png');
    List<Types> _lstrescate = [_rescateTypes];
    this.rescate = Categories(id: 1, title: 'Rescate', sub: _lstrescate, img: 'rescate.png');
    this.list.add(this.rescate);
  }

  List<Categories> getList() {
    return this.list;
  }
}