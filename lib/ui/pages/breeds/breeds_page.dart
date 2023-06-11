import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import 'package:catbreeds_bloc/ui/pages/breeds/widgets/cat_card.dart';
import 'package:catbreeds_bloc/ui/pages/breeds/widgets/breeds_app_bar.dart';



class BreedsPage extends StatelessWidget {

  const BreedsPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Theme.of(context).secondaryHeaderColor,
              systemNavigationBarIconBrightness: Brightness.dark,
              statusBarIconBrightness: Brightness.dark
            ),
            floating: true,
            toolbarHeight: 100,            
            flexibleSpace: const FlexibleSpaceBar(
              title: BreedsAppBar(),
              centerTitle: true,
              titlePadding: EdgeInsets.all(0),
            ),
            backgroundColor: Colors.transparent,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, __) {
                return Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 5),
                  child: Column(
                    children: List<Widget>.from(
                      [1, 2].map((e) {
                        return const CatCard();
                      })
                    ),
                  ),
                );
              },
            )
          )
        ],
      ),
    );
  }
}
