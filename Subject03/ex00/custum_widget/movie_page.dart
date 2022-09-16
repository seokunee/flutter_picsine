import 'package:flutter/material.dart';

class MoviePage extends StatelessWidget {
  MoviePage({Key? key}) : super(key: key);

  final List<Map<String, String>> movieData = [
    {
      'posterPath':
          '<https://image.tmdb.org/t/p/w500/1Lh9LER4xRQ3INFFi2dfS2hpRwv.jpg>'
    },
    {
      'posterPath':
          '<https://image.tmdb.org/t/p/w500/oF80bdLeRri6PFm0yAT0gRNQoDG.jpg>'
    },
    {
      'posterPath':
          '<https://image.tmdb.org/t/p/w500/8SAWREjfLyArr2pYo1gHihCthY8.jpg>'
    },
    {
      'posterPath':
          '<https://image.tmdb.org/t/p/w500/1UkbPQspPbq1FPbFP4VV1ELCfSN.jpg>'
    },
    {
      'posterPath':
          '<https://image.tmdb.org/t/p/w500/aNtAP8ZzUMdnCPoqYgVOcgI0Eh4.jpg>'
    },
    {
      'posterPath':
          '<https://image.tmdb.org/t/p/w500/yXNVcG0C7Oymg9F9ecXa9MWVwj8.jpg>'
    },
    {
      'posterPath':
          '<https://image.tmdb.org/t/p/w500/68ZwnPALUeweaFdT1z75oXJ4Xie.jpg>'
    },
    {
      'posterPath':
          '<https://image.tmdb.org/t/p/w500/l8HyObVj8fPrzacAPtGWWLDhcfh.jpg>'
    },
    {
      'posterPath':
          '<https://image.tmdb.org/t/p/w500/bZrStEjqKMRCywomPZiPkOWZpXL.jpg>'
    },
    {
      'posterPath':
          '<https://image.tmdb.org/t/p/w500/qfB6QNaCtmGDy9ujvBOUs7UaPx.jpg>'
    },
    {
      'posterPath':
          '<https://image.tmdb.org/t/p/w500/eRLlrhbdYE7XN6VtcZKy6o2BsOw.jpg>'
    },
    {
      'posterPath':
          '<https://image.tmdb.org/t/p/w500/52SgH0kLiSpWdJDOZvhAyy34uhe.jpg>'
    },
    {
      'posterPath':
          '<https://image.tmdb.org/t/p/w500/yjdOpEtlzlAnw4Kw0NGw25VrbIb.jpg>'
    },
    {
      'posterPath':
          '<https://image.tmdb.org/t/p/w500/xs7Dx72wr2H14uxu0H0R9ljDZk7.jpg>'
    },
    {
      'posterPath':
          '<https://image.tmdb.org/t/p/w500/zPDY58lk0YIxr9qsnGV64PEnjkI.jpg>'
    },
    {
      'posterPath':
          '<https://image.tmdb.org/t/p/w500/pMyOSRURkxF6YId9vOTGsBH1jRb.jpg>'
    },
    {
      'posterPath':
          '<https://image.tmdb.org/t/p/w500/jlmuSzTXOppShgYZbeetWTFTi6P.jpg>'
    },
    {
      'posterPath':
          '<https://image.tmdb.org/t/p/w500/xJY3ttefDnnn6doYQo5QOROgdvV.jpg>'
    },
    {
      'posterPath':
          '<https://image.tmdb.org/t/p/w500/w7PJ7fBEYOuaAMKfYa4zmw45v3N.jpg>'
    },
    {
      'posterPath':
          '<https://image.tmdb.org/t/p/w500/AviYDX3NuuyVQdZoLmLxNKp3zm8.jpg>'
    },
  ];

  @override
  Widget build(BuildContext context) {
    const double gap = 5;

    return (GridView.builder(
        padding: const EdgeInsets.fromLTRB(gap / 2, gap / 2, gap / 2, 0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1 / 1,
            mainAxisSpacing: gap,
            crossAxisSpacing: gap),
        itemCount: 300,
        itemBuilder: (BuildContext context, int index) {
          final String imageUrl = movieData[index].values.toString();
          return Container(
              alignment: Alignment.center,
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: Image(
                  image:
                      NetworkImage(imageUrl.substring(2, imageUrl.length - 2)),
                  fit: BoxFit.fill,
                ),
              ));
        }));
  }
}

// MoviePage 안에 변수 gap을 선언했는데  Widget build 밖에 선언한 경우는
// 에러가 납니다. 근데 movieData는 에러가 안나는데 둘의 차이점은 뭔가요?

// GridView.count로 했을 때, movieData.map으로 children에 넣는 방법이 궁금합니다.