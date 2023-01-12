
//Movie Thumbnail
import 'package:flutter/material.dart';

import '../../model/movie.dart';


class MovieThumbnail extends StatelessWidget {
  final String thumbnail;
  const MovieThumbnail({Key? key, required this.thumbnail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 180,
              decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage(thumbnail),
                      fit: BoxFit.cover
                  )
              ),
            ),
            const Icon(Icons.play_circle_fill_outlined, size: 100,color: Colors.white ,)
          ],
        ),
        Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [Color(0x00f5f5f5), Color(0xfff5f5f5)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)
          ),
          height: 80,
        )

      ],
    );
  }
}
// Movie Details with Poster after thumbnail
class MovieDetailsWithPoster extends StatelessWidget {
  final Movie movie;
  const MovieDetailsWithPoster({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7.0),
      child: Row(
        children: [
          MoviePoster(poster: movie.images[1].toString()),
          const SizedBox(width: 21,),
          Expanded(
              child:MovieDetailsHeader(movie: movie) )
        ],
      ),
    );
  }
}

//Movie poster
class  MoviePoster extends StatelessWidget {
  final String poster;
  const  MoviePoster({Key? key, required this.poster}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var borderRadius= const BorderRadius.all(Radius.circular(8));
    return Card(
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Container(
          width: MediaQuery.of(context).size.width/3,
          height: 180,
          decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(poster),
                  fit: BoxFit.cover)
          ),
        ),
      ),
    );
  }
}
//Movie Details with Header
class  MovieDetailsHeader extends StatelessWidget {
  final Movie movie;
  const  MovieDetailsHeader({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(movie.title,style: const TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
            color: Colors.black87
        ),),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text("${movie.type}, ${movie.year}, ${movie.runtime}, ${movie.lang}".toUpperCase(),
            style: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.lightBlue
            ),),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Text.rich(TextSpan(
              style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: Colors.black87
              ),
              children: [
                TextSpan(
                    text: movie.plot
                ),
                const TextSpan(
                    text: "more..",
                    style: TextStyle(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold
                    )
                )
              ]
          )),
        )
      ],
    );
  }
}
//Movie Details Cast in which all the Cast is initialized
class MovieDetailsCast extends StatelessWidget {
  final Movie movie;
  const MovieDetailsCast({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        children: [
          MovieField(field: "Cast", value: movie.actors),
          MovieField(field: "Director", value: movie.director),
          MovieField(field: "Award", value: movie.award)
        ],
      ),
    );
  }
}
//Movie Field in which value and field of cast is initialized
class MovieField extends StatelessWidget {
  final String field;
  final String value;
  const MovieField({Key? key, required this.field, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("$field :",style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w900,
            color: Colors.black38
        ),),
        Expanded(
          child: Text(value, style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black87
          ),),
        ),
      ],
    );
  }
}
//Horizontal Line class widget
class HorizontalLine extends StatelessWidget {
  const HorizontalLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Container(
        height: 0.9,
        color: Colors.black54,
      ),
    );
  }
}
//Movie Details Footer posters
class MovieDetailsFooter extends StatelessWidget {
  final List<String> posters;
  const MovieDetailsFooter({Key? key, required this.posters}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 11.0, bottom: 11.0),
          child: Text("More Movie Posters".toUpperCase(), style: const TextStyle(
              fontSize: 14,
              color: Colors.black54,
              fontWeight: FontWeight.w500
          ),),
        ),
        SizedBox(
          height: 200,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => const SizedBox(width: 8,) ,
            itemCount: posters.length,
            itemBuilder: (context, index) =>  ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Container(
                width: MediaQuery.of(context).size.width/4,
                height: 160,
                decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage(posters[index]),
                        fit: BoxFit.cover)
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
