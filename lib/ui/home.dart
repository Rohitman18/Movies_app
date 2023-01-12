import 'package:flutter/material.dart';

import '../model/movie.dart';
import 'movie_ui/movie_ui.dart';

class MoviesApp extends StatelessWidget {
  MoviesApp({Key? key}) : super(key: key);
  final List<Movie> movieList= Movie.getMovies();
  final List movies = [
    "Titanic",
    "Phir Hera Pheri",
    "Jaani Dushman",
    "Bal Hanuman",
    "Interstellar",
    "The Ghost",
    "James Bond",
    "War",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueGrey.shade700,
        title: const Text(
          "Movies App",
          style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.w800,
              fontStyle: FontStyle.italic),
        ),
      ),

      backgroundColor: Colors.grey.shade900,
      body: ListView.builder(
        itemCount: movieList.length,
        itemBuilder: (BuildContext context, int index) {
          return Stack(children: [
              movieCard(movieList[index], context),
            Positioned(
              top: 9,
                child: movieImage(movieList[index].images[0])),
          ]
          );
          // return Card(
          //   elevation: 5.9,
          //   // borderOnForeground: false,
          //   child: ListTile(
          //     leading: CircleAvatar(
          //       child: Container(
          //         width: 100,
          //         height: 100,
          //         decoration:
          //             BoxDecoration(borderRadius: BorderRadius.circular(15.2),
          //             image: DecorationImage(image: NetworkImage(movieList[index].images[0]),
          //             fit: BoxFit.cover )),
          //
          //       ),
          //     ),
          //     trailing: const Text("...."),
          //     title: Text(
          //       movieList[index].title,
          //       style: const TextStyle(
          //         fontStyle: FontStyle.italic,
          //         fontWeight: FontWeight.w700,
          //         fontSize: 20,
          //       ),
          //     ),
          //     subtitle: const Text("Click on the movie"),
          //     onTap: () {
          //       Navigator.push(
          //           context,
          //           MaterialPageRoute(
          //               builder: (context) => MoviesOnClick(movieName: movieList[index].writer, movie:  movieList[index],)));
          //     },
          //     // onTap: () => debugPrint("Tapped on movie: ${movies[index]}"),
          //     onLongPress: () => debugPrint("........"),
          //   ),
          // );
        },
      ),
    );
  }
  //For the movie card
  Widget movieCard(Movie movie , BuildContext context) {
    return InkWell(
      child: Container(
        margin: const EdgeInsets.only(left: 56, top: 3, bottom: 3),
        width: MediaQuery.of(context).size.width,
        height: 110.0,
        child: Card(
          color: Colors.blueGrey.shade800,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0,
            right: 8.0,
            left: 45,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(movie.title, style:const TextStyle(
                          fontSize: 19,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                            color: Colors.white
                        )),
                      ),
                      Text("Rating: ${movie.imdbRating} / 10",  style: mainTextStyle()),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Released: ${movie.released}", style: mainTextStyle()),
                      Text(movie.rated,  style: mainTextStyle()),
                      Text(movie.runtime, style: mainTextStyle()),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MoviesOnClick(movieName: movie.title, movie: movie,)));
        },
    );
  }
  TextStyle mainTextStyle(){
    return const TextStyle(
      fontSize: 15.0,
      color: Colors.white70
    );
  }
  // For the movie image
  Widget movieImage(String imageUrl){
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(image: NetworkImage(imageUrl),
          fit: BoxFit.cover,)
      ),
    );
  }
}
// New Route or page
class MoviesOnClick extends StatelessWidget {
  final Movie movie;
  final String movieName;
  const MoviesOnClick({Key? key,required this.movieName,  required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movies"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey.shade700,
      ),
      // backgroundColor: Colors.grey.shade900,
      body: ListView(

        children: [
          MovieThumbnail(thumbnail: movie.images[2]),
          MovieDetailsWithPoster(movie: movie),
          const HorizontalLine(),
          MovieDetailsCast(movie: movie),
          const HorizontalLine(),
          MovieDetailsFooter(posters: movie.images)
        ],
      ),
      // body: Center(
      //   child: Container(
      //       child: ElevatedButton(
      //           onPressed: () {
      //             Navigator.pop(context);
      //           },
      //           child: Text("Go Back ${movie.title}"))),
      // ),
    );
  }
}






//-----END OF MOVIE APP-----