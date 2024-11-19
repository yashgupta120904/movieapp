import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final Map<String, dynamic> movie;

  // Constructor to receive movie data
  DetailsScreen({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          movie['name'] ?? 'Movie Details',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white), 
          onPressed: () {
            Navigator.pop(context);  
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Movie Poster (with BoxFit.contain to prevent zooming)
              Container(
                width: double.infinity,
                height: 440,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  image: DecorationImage(
                    image: NetworkImage(
                      movie['image']?['original'] ??
                          'https://via.placeholder.com/400x300',
                    ),
                    fit: BoxFit.cover,  // Prevent zooming
                  ),
                ),
              ),
              SizedBox(height: 16.0),

              // Movie Title (centered)
              Text(
                movie['name'] ?? 'N/A',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8.0),

              // IMDb Rating (centered)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'IMDb: ',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.orangeAccent,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    movie['rating']?['average']?.toStringAsFixed(1) ?? 'N/A',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.0),

              // Duration (if available)
              Text(
                'Duration: ${movie['runtime']?.toString() ?? 'N/A'} min',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8.0),

              // Movie Description (centered and wrapped)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  movie['summary']?.replaceAll(RegExp('<[^>]*>'), '') ??
                      'No description available.',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: const Color.fromARGB(255, 250, 247, 247),
                  ),
                  textAlign: TextAlign.justify,
                  maxLines: 20,
                  
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
