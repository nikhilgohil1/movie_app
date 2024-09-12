import 'package:flutter/material.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class MovieDetails extends StatefulWidget {
  final Movie movie;
  const MovieDetails({super.key, required this.movie});

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  @override
  Widget build(BuildContext context) {
    double rating = widget.movie.voting * 10;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: const Text(
          "Movie Corner",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                widget.movie.title,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Image.network(
                  "https://image.tmdb.org/t/p/original/${widget.movie.backdropPath}"),
              Text(
                widget.movie.overview,
                style: const TextStyle(color: Colors.white),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: SizedBox(
                  height: 150,
                  width: 150,
                  child: SfRadialGauge(
                    axes: <RadialAxis>[
                      RadialAxis(
                        minimum: 0,
                        maximum: 100,
                        showLabels: false,
                        showTicks: false,
                        startAngle: 270,
                        endAngle: 270,
                        axisLineStyle: const AxisLineStyle(
                          thickness: 1,
                          color: Color.fromARGB(255, 0, 169, 181),
                          thicknessUnit: GaugeSizeUnit.factor,
                        ),
                        pointers: <GaugePointer>[
                          RangePointer(
                            value: rating,
                            cornerStyle: CornerStyle.bothCurve,
                            width: 0.15,
                            sizeUnit: GaugeSizeUnit.factor,
                            color: Colors.white,
                            animationType: AnimationType.ease,
                            pointerOffset: 0.1,
                            enableAnimation: true,
                          )
                        ],
                        annotations: <GaugeAnnotation>[
                          GaugeAnnotation(
                            widget: Text(
                              '${rating.toStringAsFixed(0)} %',
                              style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                          ))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
