import 'package:flutter/material.dart';
import 'package:flutter_application_1/Maps_Cubit/cubit.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/repository/maps_repo.dart';
import 'package:flutter_application_1/web_services/Places_WebServices.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../modules/Map_screen/map_screen.dart';
import '../shared/constants/constants.dart';

class AppRouter {

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case mapScreen:
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider(
                create: (BuildContext context) =>
                    MapsCubit(MapsRepository(PlacesWebservices())),
                child: MapScreen(),
              ),
        );
    }
  }
}