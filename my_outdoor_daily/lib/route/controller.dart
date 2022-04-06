import 'package:flutter/material.dart';
import 'package:my_outdoor_daily/pages/activities.dart';
import 'package:my_outdoor_daily/pages/activities_subpages/camping/camping_clothings.dart';
import 'package:my_outdoor_daily/pages/activities_subpages/camping/camping_equipments.dart';
import 'package:my_outdoor_daily/pages/activities_subpages/climbing/climbing_clothings.dart';
import 'package:my_outdoor_daily/pages/activities_subpages/climbing/climbing_equipments.dart';
import 'package:my_outdoor_daily/pages/activities_subpages/climbing/climbing_places.dart';
import 'package:my_outdoor_daily/pages/login_page.dart';
import 'package:my_outdoor_daily/pages/main_page.dart';
import 'package:my_outdoor_daily/pages/my_notes.dart';
import 'package:my_outdoor_daily/pages/my_notes_subpages/note_add.dart';
import 'package:my_outdoor_daily/pages/my_notes_subpages/notes.dart';
import 'package:my_outdoor_daily/pages/my_notes_subpages/notes_detay.dart';
import '../main.dart';
import '../pages/activities_subpages/camping/camping.dart';
import '../pages/activities_subpages/camping/camping_places.dart';
import '../pages/activities_subpages/climbing/climbing.dart';
import '../pages/activities_subpages/trekking/trekking.dart';
import '../pages/activities_subpages/trekking/trekking_clothings.dart';
import '../pages/activities_subpages/trekking/trekking_equipments.dart';
import '../pages/activities_subpages/trekking/trekking_places.dart';
import '../pages/google_maps.dart';

class Controller {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const MainApp());
      case '/mainpage':
        return MaterialPageRoute(builder: (_) => const MainPage());
      case '/activities':
        return MaterialPageRoute(builder: (_) => const Activities());
      case '/mynotes':
        return MaterialPageRoute(builder: (_) => const MyNotes());
      case '/notes':
        return MaterialPageRoute(builder: (_) => const Notes());
      case '/noteadd':
        return MaterialPageRoute(builder: (_) => NoteAdd());
      case '/notesdetay':
        return MaterialPageRoute(builder: (_) => const NotesDetay(index: 2));
      case '/loginpage':
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case '/googlemap':
        return MaterialPageRoute(builder: (_) => const MapSample());
      case '/camping':
        return MaterialPageRoute(builder: (_) => const Camping());
      case '/climbing':
        return MaterialPageRoute(builder: (_) => const Climbing());
      case '/trekking':
        return MaterialPageRoute(builder: (_) => const Trekking());
      case '/campingplaces':
        return MaterialPageRoute(builder: (_) => const CampingPlaces());
      case '/campingequipments':
        return MaterialPageRoute(builder: (_) => const CampingEquipments());
      case '/campingclothings':
        return MaterialPageRoute(builder: (_) => const CampingClothings());
      case '/climbingplaces':
        return MaterialPageRoute(builder: (_) => const ClimbingPlaces());
      case '/climbingequipments':
        return MaterialPageRoute(builder: (_) => const ClimbingEquipments());
      case '/climbingclothings':
        return MaterialPageRoute(builder: (_) => const ClimbingClothings());
      case '/trekkingplaces':
        return MaterialPageRoute(builder: (_) => const TrekkingPlaces());
      case '/trekkingequipments':
        return MaterialPageRoute(builder: (_) => const TrekkingEquipments());
      case '/trekkingclothings':
        return MaterialPageRoute(builder: (_) => const TrekkingClothings());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
