import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_jojo/presentation/bloc/search_bloc/search_bloc.dart';
import 'package:weather_jojo/presentation/bloc/search_bloc/search_event.dart';
import 'package:weather_jojo/presentation/bloc/search_bloc/search_state.dart';
import 'package:weather_jojo/presentation/bloc/weather_bloc/weather_bloc.dart';
import 'package:weather_jojo/presentation/bloc/weather_bloc/weather_event.dart';
import 'package:weather_jojo/presentation/bloc/weather_bloc/weather_state.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  static const routeName = '/search';

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    context.read<SearchBloc>().add(OnInitCacheLocations());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.white),
        title: TextFormField(
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: 'Search',
            hintStyle: TextStyle(color: Colors.white),
            border: InputBorder.none,
          ),
          onFieldSubmitted: (value) {
            context.read<WeatherBloc>().add(OnChangeSearch(name: value.trim()));
            context
                .read<SearchBloc>()
                .add(OnCacheSearchLocation(name: value.trim()));

            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Text(
                'Recent Locations',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              )),
          Expanded(
            child: BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                if (state is RecentSearchLoaded) {
                  return ListView.builder(
                    itemCount: state.locations.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Icon(
                          Icons.location_on,
                          color: Colors.white,
                        ),
                        onTap: () {
                          context.read<WeatherBloc>().add(OnChangeSearch(
                              name: state.locations[index].trim()));
                          Navigator.pop(context);
                        },
                        title: Text(
                          state.locations[index],
                          style: TextStyle(color: Colors.white),
                        ),
                        trailing: IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            context.read<SearchBloc>().add(
                                OnDeleteRecentLocation(
                                    name: state.locations[index]));
                          },
                        ),
                      );
                    },
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          )
        ],
      ),
    );
  }
}
