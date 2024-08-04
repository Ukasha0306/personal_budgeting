import 'package:flutter/material.dart';
import 'package:personal_budgeting/utils/routes/route_name.dart';
import 'package:personal_budgeting/view/add_category_screen.dart';
import 'package:personal_budgeting/view/details_screen.dart';
import '../../view/main_screen.dart';

class Routes {
  static Route<dynamic> generatedRoute(RouteSettings settings) {
    switch (settings.name) {

      case RoutesName.main:
        return MaterialPageRoute(builder: (context) =>  const MainScreen());
      case RoutesName.details:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(builder: (context) =>  DetailsScreen(
          budget: args['budget'],
          id: args['id'],
          spent: args['spent'],
          name: args['name'],
        ));
      case RoutesName.addOrEdit:

        return MaterialPageRoute(
            builder: (context) =>  const AddCategoryScreen());

      default:
        return MaterialPageRoute(
          builder: (_) {
            return const Scaffold(
              body: Center(
                child: Text('No route defined'),
              ),
            );
          },
        );
    }
  }
}
