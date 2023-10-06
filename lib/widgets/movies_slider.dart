import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tmdbapi/widgets/constants.dart';

class MoviesSlider extends StatelessWidget {
  const MoviesSlider({
    Key? key,
    required this.snapshot,
  }) : super(key: key);
  
  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: snapshot.data!.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                '${Constants.imagePath}${snapshot.data[index].posterPath}',
                filterQuality: FilterQuality.high,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
