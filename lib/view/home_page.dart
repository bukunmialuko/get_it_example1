import 'package:flutter/material.dart';
import 'package:get_it_example1/domain/meme_controller.dart';
import 'package:get_it_example1/domain/models/meme.dart';

import '../locator.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  _HomePageViewState createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  Meme? visibleMeme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: visibleMeme == null
              ? Center(child: Text("No Meme loaded yet"))
              : Center(
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "CATEGORY: ${visibleMeme?.category}",
                            style: TextStyle(fontSize: 36),
                          ),
                          SizedBox(height: 8),
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                            ),
                            child: Image.network(visibleMeme?.imageUrl ?? "",
                                fit: BoxFit.fitWidth),
                          ),
                          SizedBox(height: 8),
                          Text("Caption: ${visibleMeme?.caption}"),
                        ],
                      ),
                    ),
                  ),
                )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.skip_next),
        onPressed: () async {
          Meme meme = await getIt.get<MemeDomainController>().getNextMeme();
          setState(() {
            visibleMeme = meme;
          });
        },
      ),
    );
  }
}
