import 'package:flutter/material.dart';
import 'package:news_app/utils/route/app_routes.dart';
import 'package:news_app/view_models/home/home_cubit.dart';
import 'package:news_app/views/articles/article_page.dart';
import 'package:news_app/views/home/home_page.dart';
import 'package:news_app/views/not_found_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) {
              final cubit =HomeCubit();
              cubit.getTopHeadline();
              return cubit;
            }, 
            child: const HomePage(),
          ),
        );
      case AppRoutes.article:
        return MaterialPageRoute(
          builder: (_) => const ArticlePage(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const NotFoundPage(),
        );
    }
  }
}
