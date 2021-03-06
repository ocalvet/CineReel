import 'package:cine_reel/api/tmdb_api.dart';
import 'package:cine_reel/bloc/bloc_provider.dart';
import 'package:cine_reel/bloc/genres_bloc.dart';
import 'package:cine_reel/bloc/movie_bloc.dart';
import 'package:cine_reel/bloc/seach_movies_bloc.dart';
import 'package:cine_reel/bloc/search_people_bloc.dart';
import 'package:cine_reel/ui/genres/genres_screen.dart';
import 'package:cine_reel/ui/list_screen/movies_list_screen.dart';
import 'package:cine_reel/ui/search_screen/search_screen_content.dart';
import 'package:cine_reel/ui/tabs/tab_object.dart';
import 'package:flutter/src/widgets/editable_text.dart';
import 'package:url_launcher/url_launcher.dart';

launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

BlocProvider<GenresBloc> getGenresProvider() {
  return BlocProvider<GenresBloc>(
    child: GenresScreen(),
    bloc: GenresBloc(tmdbApi: TMDBApi(), fetchOnInit: true),
  );
}

BlocProvider<MovieBloc> getNowPlayingProvider() {
  return BlocProvider<MovieBloc>(
    child: MoviesListScreen(),
    bloc: MovieBloc(api: TMDBApi(), tabKey: TabKey.kNowPlaying),
  );
}

BlocProvider<MovieBloc> getTopRatedProvider() {
  return BlocProvider<MovieBloc>(
    child: MoviesListScreen(),
    bloc: MovieBloc(api: TMDBApi(), tabKey: TabKey.kTopRated),
  );
}

BlocProvider<MovieBloc> getPopularProvider() {
  return BlocProvider<MovieBloc>(
    child: MoviesListScreen(),
    bloc: MovieBloc(api: TMDBApi(), tabKey: TabKey.kPopular),
  );
}

BlocProvider<MovieBloc> getUpcomingProvider(String region) {
  return BlocProvider<MovieBloc>(
    child: MoviesListScreen(),
    bloc: MovieBloc(api: TMDBApi(), tabKey: TabKey.kUpcoming, region: region),
  );
}

BlocProvider<SearchMoviesBloc> getMovieSearchProvider(TextEditingController textController) {
	return BlocProvider<SearchMoviesBloc>(
		child: SearchContentScreen(textController, TabKey.kSearchMovies),
		bloc: SearchMoviesBloc(TMDBApi()),
	);
}

BlocProvider<SearchPeopleBloc> getPeopleSearchProvider(TextEditingController textController) {
	return BlocProvider<SearchPeopleBloc>(
		child: SearchContentScreen(textController, TabKey.kSearchPeople),
		bloc: SearchPeopleBloc(TMDBApi()),
	);
}