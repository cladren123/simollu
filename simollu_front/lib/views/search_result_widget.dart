import 'package:flutter/material.dart';

class SearchResultWidget extends StatefulWidget {
  final String name;
  final String imageUrl;
  final String waitingTime;
  final String queueSize;
  final int numberOfPeople;
  final VoidCallback onWait;

  const SearchResultWidget({
    Key? key,
    required this.name,
    required this.imageUrl,
    required this.waitingTime,
    required this.queueSize,
    required this.numberOfPeople,
    required this.onWait,
  }) : super(key: key);

  @override
  State<SearchResultWidget> createState() => _SearchResultWidgetState();
}

class _SearchResultWidgetState extends State<SearchResultWidget> {

  int _numberOfPeople = 1;

  void _incrementNumberOfPeople() {
    setState(() {
      _numberOfPeople++;
    });
  }

  void _decrementNumberOfPeople() {
    setState(() {
      if (_numberOfPeople > 1) {
        _numberOfPeople--;
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      padding: EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start, // 위젯 위쪽 정렬
              children: [
                SizedBox(
                  // height: 180,
                  child: Align(
                    alignment: Alignment.center,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        widget.imageUrl,
                        width: 80,
                        height: 80,
                        fit: BoxFit
                            .cover, // 이미지가 Container에 꽉 차게 보이도록 설정
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10, top: 10),
                        child: SizedBox(
                          child: Text(
                            widget.name,
                            maxLines: 2,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.normal,
                              letterSpacing: 0,
                              wordSpacing: 0,
                              height: 1.0,
                              shadows: [],
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(
                                  Icons.schedule,
                                  color: Color(0xFFFFD200),
                                ),
                                Text(
                                  '1시간 30분 웨이팅',
                                  maxLines: 2,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.normal,
                                    letterSpacing: 0,
                                    wordSpacing: 0,
                                    height: 1.0,
                                    shadows: [],
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(
                                  Icons.schedule,
                                  color: Color(0xFFFFD200),
                                ),
                                Text(
                                  '현재 3팀 대기 중',
                                  maxLines: 2,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.normal,
                                    letterSpacing: 0,
                                    wordSpacing: 0,
                                    height: 1.0,
                                    shadows: [],
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row( // 인원 수, 웨이팅하기 버튼
            children: [
              Expanded(
                child: Row(
                  children: [
                    SizedBox(
                      width: 8,
                    ),
                    InkWell(
                      onTap: _decrementNumberOfPeople,
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Icon(Icons.remove),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Container(
                      width: 70,

                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 7.5),
                      child: Text(
                        '$_numberOfPeople',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    InkWell(
                      onTap: _incrementNumberOfPeople,
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Icon(Icons.add),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 160,
                height: 40,
                child: OutlinedButton(
                  onPressed: () {
                    print('웨이팅하기 ! 클릭');
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Color(0xFFFFD200),
                    side: BorderSide(
                      color: Color(0xFFFFD200),
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.only(
                        top: 10, bottom: 10),
                    child: Text(
                      '웨이팅하기',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Roboto',
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal,
                        letterSpacing: 0,
                        wordSpacing: 0,
                        height: 1.0,
                        shadows: [],
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
