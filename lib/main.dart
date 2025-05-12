import 'dart:convert';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EL CUCHILLO',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
        ),
      ),
      home: ImageGridScreen(),
    );
  }
}

class ImageGridScreen extends StatelessWidget {
  final List<Map<String, String>> imageData = [
    {
      'url':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQF7CAZjotnksBobXQRBH1t1Wr8jp1K-ENvw&s',
      'subtitle': 'El Cuchillo APP'
    },
    {
      'url':
          'data:image/png;base64,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',
      'subtitle': 'Plan Habitual'
    },
    {
      'url':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSHQE2ZquRFRCEJg01rbNyA2UGxN--wuIiyIQ&s',
      'subtitle': 'Tik Tok'
    },
    {
      'url':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR1q6z2kV8_7RZuJAp74ii9srftzUxaoYSRAw&s',
      'subtitle': 'Messenger'
    },
    {
      'url':
          'https://upload.wikimedia.org/wikipedia/commons/thumb/9/95/Instagram_logo_2022.svg/1200px-Instagram_logo_2022.svg.png',
      'subtitle': 'Instagram'
    },
    {
      'url': 'https://static.xx.fbcdn.net/rsrc.php/v4/yG/r/pENh3y_2Pnw.png',
      'subtitle': 'Facebook'
    },
    {
      'url':
          'https://png.pngtree.com/png-clipart/20181003/ourmid/pngtree-whatsapp-social-media-icon-design-template-vector-whatsapp-logo-png-image_3654780.png',
      'subtitle': 'Whatsapp'
    },
    {
      'url':
          'https://yt3.googleusercontent.com/PKRBxhCiGa8Y0vPmHa1E2cdjpLhUq2Pl-gESwP7kk2plGgxLdsbjyTd9VjcJwBMiY0HQ8bvx5Q=s900-c-k-c0x00ffffff-no-rj',
      'subtitle': 'Github'
    },
  ];

  Widget _buildImage(String imageUrl, String subtitle) {
    if (imageUrl.startsWith('data:image')) {
      try {
        final base64String = imageUrl.split(',').last;
        final bytes = base64Decode(base64String);
        return Image.memory(
          bytes,
          fit: BoxFit.contain,
          semanticLabel: subtitle,
        );
      } catch (e) {
        return Center(child: Icon(Icons.error_outline, color: Colors.red));
      }
    } else {
      return Image.network(
        imageUrl,
        fit: BoxFit.contain,
        semanticLabel: subtitle,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Center(child: CircularProgressIndicator());
        },
        errorBuilder: (context, error, stackTrace) =>
            Center(child: Icon(Icons.error_outline, color: Colors.red)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('El Cuchillo'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                'https://png.pngtree.com/png-vector/20220521/ourmid/pngtree-google-search-bar-and-icon-png-image_4697882.png',
                height: 100,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(10.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 0.8,
              ),
              itemCount: imageData.length,
              itemBuilder: (context, index) {
                final imageUrl = imageData[index]['url']!;
                final subtitle = imageData[index]['subtitle']!;

                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[900],
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      side: BorderSide(color: Colors.grey.shade700),
                    ),
                    elevation: 3,
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Botón presionado: $subtitle')),
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(6.0),
                            child: _buildImage(imageUrl, subtitle),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 6.0),
                        child: Text(
                          subtitle,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
