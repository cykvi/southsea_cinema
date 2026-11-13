import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';

class MovieListing extends StatefulWidget {
  const MovieListing({super.key});

  @override
  State<MovieListing> createState() => _MovieListingState();
}

class _MovieListingState extends State<MovieListing> {
  int _ticketQuantity = 1;
  String _bookingMessage = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle, style: cinemaHeaderStyle),
        backgroundColor: cinemaSurface,
        iconTheme: const IconThemeData(color: cinemaBrand),
        elevation: 0,
      ),
      drawer: const NavDrawer(),
      body: Container(
        color: cinemaBrandDark,
          child: Column(
        children: [
          Text('Movie Listing'),
          Text('This is the movie listing description.'),
          DropdownMenu<int>(
            initialSelection: _ticketQuantity,
            onSelected: (int? value) {
              if (value != null) {
                setState(() {
                  _ticketQuantity = value;
                });
              }
            },
            dropdownMenuEntries: [
              DropdownMenuEntry(value: 1, label: '1'),
              DropdownMenuEntry(value: 2, label: '2'),
              DropdownMenuEntry(value: 3, label: '3'),
              DropdownMenuEntry(value: 4, label: '4'),
              DropdownMenuEntry(value: 5, label: '5'),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _bookingMessage =
                    'You have added $_ticketQuantity ticket(s) to your order.';
              });
              print('Add to order button pressed');
            },
            child: const Text('Add to Order'),
            
            
          ),
          Text(_bookingMessage),
        ],
      )),
    );
  }
}
