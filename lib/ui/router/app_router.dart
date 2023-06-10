import 'package:go_router/go_router.dart';


import 'package:catbreeds_bloc/ui/router/app_routes.dart';

import 'package:catbreeds_bloc/ui/pages/breeds/breeds_page.dart';
import 'package:catbreeds_bloc/ui/pages/detail/detail_page.dart';



final appRouter = GoRouter(
  initialLocation: AppRoutesEnum.breeds.path,
  routes: [
    GoRoute(
      path: AppRoutesEnum.breeds.path,
      builder: (context, state) => const BreedsPage(),
    ),
    GoRoute(
      path: AppRoutesEnum.detail.path,
      builder: (context, state) => const DetailPage(),
    )
  ],
  redirect: (context, state) {
    
    return null;
  },
);