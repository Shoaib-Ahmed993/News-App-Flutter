import 'package:flutter/material.dart';
import 'package:search_page/search_page.dart';

/// This is a very simple class, used to
/// demo the `SearchPage` package
class NEWS {
  final String top, surname;
  final String news;

  NEWS(this.top, this.surname, this.news);
}

class SearchScreen extends StatelessWidget {
  static List<NEWS> news = [
    NEWS("Evergrande Backer Chinese Estates to Go Private After Plunge - Bloomberg Markets and Finance", 'Barron', "2021-10-07T03:02:17Z"),
    NEWS("AT&T played integral part in creating, funding One American News: report - Fox News", 'Black', "2021-10-07T02:51:55Z"),
    NEWS("Hypocrites at Fox News Undermine COVID Vaccine & Zuckerberg Fires Back at Facebook Whistleblower - Jimmy Kimmel Live", 'Edwards', "2021-10-07T02:11:38Z"),
    NEWS("Price spike: Are whales front-running the approval of a Bitcoin futures ETF? - Cointelegraph", 'Johnson',  "2021-10-07T02:11:00Z"),
    NEWS("Bitcoin Dominates Ethereum, Dogecoin Gains And Shiba Inu Extends Eye-Popping Rally - Benzinga - Benzinga", 'Brooks', "2021-10-07T01:47:00Z"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //    App Bar
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.blue),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Flutter",
              style:
                  TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
            ),
            Text(
              "News",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
            )
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),

      //    Body
      body: ListView.builder(
        itemCount: news.length,
        itemBuilder: (context, index) {
          final NEWS person = news[index];
          return ListTile(
            title: Text(person.top),
            subtitle: Text(person.surname),
            trailing: Text('${person.news}'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        tooltip: 'Search NEWS',
        onPressed: () => showSearch(
          context: context,
          delegate: SearchPage<NEWS>(
            onQueryUpdate: (s) => print(s),
            items: news,
            searchLabel: 'Search News' ,
            
            suggestion: Center(
              child: Text('Filter news by date, day or time'),
            ),
            failure: Center(
              child: Text('No person found :('),
            ),
            filter: (person) => [
              person.top,
              person.surname,
              person.news.toString(),
            ],
            builder: (person) => ListTile(
              title: Text(person.top),
              subtitle: Text(person.surname),
              trailing: Text('${person.news} yo'),
            ),
          ),
        ),
        child: Icon(Icons.search, color: Colors.grey.shade50),
      ),
    );
  }
}
