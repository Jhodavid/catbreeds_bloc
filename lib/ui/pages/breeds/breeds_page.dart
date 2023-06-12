import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';


import 'package:catbreeds_bloc/data/utils/enums/breeds_request_status_enum.dart';

import 'package:catbreeds_bloc/device/localization/app_localizations.dart';

import 'package:catbreeds_bloc/domain/entities/breed_entity.dart';
import 'package:catbreeds_bloc/domain/blocs/breeds/breeds_bloc.dart';

import 'package:catbreeds_bloc/ui/pages/breeds/widgets/cat_card.dart';
import 'package:catbreeds_bloc/ui/pages/breeds/widgets/breeds_app_bar.dart';



class BreedsPage extends StatefulWidget {

  const BreedsPage({super.key});

  @override
  State<BreedsPage> createState() => _BreedsPageState();
}

class _BreedsPageState extends State<BreedsPage> {

  String filterText = '';
  late List<BreedEntity> filteredBreedList;

  @override
  void initState() {
    super.initState();
    filteredBreedList = BlocProvider.of<BreedsBloc>(context).state.breedList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BreedsBloc, BreedsState>(
        builder: (context, state) {

          if(state.requestState == BreedsRequestStatesEnum.loadingBreeds) {
            return _LoadingBreedsMessage();
          }

          if(state.requestState == BreedsRequestStatesEnum.errorInBreeds) {
            return _NetworkErrorMessage();
          }

          if(filterText.isEmpty) {
            filteredBreedList = state.breedList;
          } else {
            filteredBreedList = state.breedList.where(
              (breed) => breed.name.toLowerCase().contains(
                filterText.toLowerCase()
              )
            ).toList();
          }

          return CustomScrollView(
            slivers: [
              SliverAppBar(
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Theme.of(context).secondaryHeaderColor,
                  systemNavigationBarIconBrightness: Brightness.dark,
                  statusBarIconBrightness: Brightness.dark
                ),
                floating: true,
                toolbarHeight: 100,
                flexibleSpace: FlexibleSpaceBar(
                  title: BreedsAppBar(
                    searchTextValue: filterText,
                    onChangeSearch: (searchValue) => setState(() {
                      filterText = searchValue;
                    })
                  ),
                  centerTitle: true,
                  titlePadding: const EdgeInsets.all(0),
                ),
                backgroundColor: Colors.transparent,
              ),
              
              SliverList(
                delegate: filteredBreedList.isEmpty ? SliverChildBuilderDelegate(
                    (context, index) => _NoResultsMessage(),
                    childCount: 1
                  ) 
                  : SliverChildBuilderDelegate(
                    childCount: filteredBreedList.length,
                    (_, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 5),
                        child: CatCard(
                          breed: filteredBreedList[index],
                        )
                      );
                    },
                  )
              )
            ],
          );
        },
      ),
    );
  }
}


class _NoResultsMessage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final textStylesTheme = Theme.of(context).textTheme;
    final localeStrings = AppLocalizations.of(context).breedsModule;

    final height = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.only(top: height*0.3),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.info_rounded,
          ),
          const SizedBox(height: 5),
          Text(
            localeStrings.noResult,
            style: textStylesTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}

class _NetworkErrorMessage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final textStylesTheme = Theme.of(context).textTheme;
    final localeStrings = AppLocalizations.of(context).breedsModule;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.warning_rounded,
            color: Colors.red.withOpacity(0.8),
          ),
          const SizedBox(height: 5),
          SizedBox(
            width: 250,
            child: Text(
              localeStrings.networkError,
              style: textStylesTheme.bodyMedium,
            ),
          ),
          TextButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  localeStrings.refresh,
                  style: textStylesTheme.bodyMedium,
                ),
                const SizedBox(width: 5),
                const Icon(
                  Icons.refresh_rounded
                ),
              ],
            ),
            onPressed: () => BlocProvider.of<BreedsBloc>(context).getCatBreedsData(),
          )
        ],
      ),
    );
  }
}

class _LoadingBreedsMessage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final textStylesTheme = Theme.of(context).textTheme;
    final localeStrings = AppLocalizations.of(context).breedsModule;
    
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 60,
            width: 60,
            child: Image.asset('assets/images/searching_cat_breeds.gif')
          ),
          Text(
            localeStrings.searchCatBreeds,
            style: textStylesTheme.bodyMedium,
          )
        ],
      ),
    );
  }
}
