import 'package:flutter/material.dart';
import 'package:simollu_front/views/writing_review_page.dart';

class WaitingRecordcard extends StatefulWidget {
  final bool? isCanclled;

  const WaitingRecordcard({Key? key,
    this.isCanclled = false,
  }) : super(key: key);

  @override
  State<WaitingRecordcard> createState() => _WaitingRecordcardState();
}

class _WaitingRecordcardState extends State<WaitingRecordcard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      margin: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width * 0.9,
      // height: 100,
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black12,
          ),
          borderRadius: BorderRadius.circular(3)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 10),
            child: Text(
              '바스버거 역삼점',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18
              ),
            ),
          ),
          _buildPadding("예약일시", "2023/03/18(목) 13:45"),
          _buildPadding("대기번호", "9번"),
          _buildPadding("인원", "2명"),
          if (widget.isCanclled == false)
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
              child: Center(
                child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.black,
                      fixedSize: Size(
                        MediaQuery.of(context).size.width * 0.95,
                        40
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context, 
                          MaterialPageRoute(builder: (context) => WritingReviewPage()),
                      );
                    },
                    child: Text('리뷰 작성 하기')
                ),
              ),
            )
        ],
      ),
    );
  }

  Widget _buildPadding(String label, String value) {

    return Padding(
          padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label),
              Text(value)
            ],
          ),
        );
  }
}
