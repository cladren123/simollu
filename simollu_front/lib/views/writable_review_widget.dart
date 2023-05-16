import 'package:flutter/material.dart';
import 'package:simollu_front/models/writeableModel.dart';
import 'package:simollu_front/views/writing_review_page.dart';

class WritableReview extends StatelessWidget {
  late Future<List<WriteableModel>> reviews;

  WritableReview({
    Key? key,
    required this.reviews,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder(
            future: reviews,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data!.length,
                    itemBuilder: ((context, index) {
                      WriteableModel review = snapshot.data![index];
                      return Card(
                        child: ListTile(
                          title: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  review.restaurantImg ?? 'https://example.com/placeholder.jpg', // imageUrl 값이 없을 경우 대체 이미지 URL 사용
                                  width: 80,
                                  height: 80,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) { // 이미지 로딩 실패 시 대체 이미지 보여주기
                                    return Image.network(
                                      'https://cdn.pixabay.com/photo/2023/04/28/07/07/cat-7956026_960_720.jpg',
                                      width: 80,
                                      height: 80,
                                      fit: BoxFit.cover,
                                    );
                                  },
                                ),
                              ),
                              SizedBox(width: 20,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    review.restaurantName as String,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    review.waitingCompleteDate as String
                                  )
                                ],
                              )
                            ],
                          ),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              OutlinedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) =>
                                        WritingReviewPage(
                                          review: review
                                        )
                                      )
                                    );
                                  },
                                  child: Text('리뷰 쓰기')
                              )
                            ],
                          )
                        ),
                      );
                    }));
              } else {
                return CircularProgressIndicator();
              }
            })
      ],
    );
    // return Card(
    //   elevation: 2.0, //그림자 깊이
    //   child: Container(
    //     padding: EdgeInsets.symmetric(horizontal: 9, vertical: 10),
    //     child: Row(
    //       crossAxisAlignment: CrossAxisAlignment.start, // 위젯 위쪽 정렬
    //       children: [
    //         ClipRRect(
    //           borderRadius: BorderRadius.circular(10),
    //           child: Image.asset(
    //             'assets/dongraejeong.png',
    //             width: 80,
    //             height: 80,
    //             fit: BoxFit.cover, // 이미지가 Container에 꽉 차게 보이도록 설정
    //           ),
    //         ),
    //         Container(
    //           padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
    //           child: Column(
    //             mainAxisAlignment: MainAxisAlignment.start,
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               Container(
    //                 child: Text(
    //                   '동래정 선릉직영점',
    //                   style: TextStyle(
    //                     color: Colors.black,
    //                     fontSize: 15,
    //                     fontFamily: 'Roboto',
    //                     fontWeight: FontWeight.bold,
    //                     fontStyle: FontStyle.normal,
    //                     letterSpacing: 0,
    //                     wordSpacing: 0,
    //                     height: 1.0,
    //                     shadows: [],
    //                     decoration: TextDecoration.none,
    //                   ),
    //                 ),
    //               ),
    //
    //               Container(
    //                 margin: EdgeInsets.only(top: 19),
    //                 child: Container(
    //                   // padding: EdgeInsets.symmetric(horizontal: 9, vertical: 10),
    //                   child: Text(
    //                     '2023-04-12 (수) 19:14',
    //                     style: TextStyle(
    //                       color: Colors.black,
    //                       fontSize: 14,
    //                       fontFamily: 'Roboto',
    //                       // fontWeight: FontWeight.w600,
    //                       fontStyle: FontStyle.normal,
    //                       letterSpacing: 0,
    //                       wordSpacing: 0,
    //                       height: 1.0,
    //                       shadows: [],
    //                       decoration: TextDecoration.none,
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //         Expanded( // 나머지 공간을 차지하기 위한 Expanded 위젯
    //           child: Container(
    //             // width: 20,
    //           ),
    //         ),
    //         Column(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           // crossAxisAlignment: CrossAxisAlignment.end,
    //           children: [
    //             Column(
    //               // mainAxisAlignment: MainAxisAlignment.center,
    //               children: [
    //                 OutlinedButton(
    //                   onPressed: () {
    //                     Navigator.push(context, MaterialPageRoute(builder: (context) => WritingReviewPage()));
    //                   },
    //                   style: OutlinedButton.styleFrom(
    //                     backgroundColor: Color(0xFFFFD200),
    //                     side: BorderSide(
    //                       color: Color(0xFFFFD200),
    //                       width: 1.0,
    //                     ),
    //                   ),
    //                   child: SizedBox(
    //                     child: Text(
    //                       '리뷰 쓰기',
    //                       maxLines: 3,
    //                       style: TextStyle(
    //                         color: Colors.black,
    //                         fontFamily: 'Roboto',
    //                         fontSize: 13,
    //                         fontWeight: FontWeight.bold,
    //                         fontStyle: FontStyle.normal,
    //                         letterSpacing: 0,
    //                         wordSpacing: 0,
    //                         height: 1.0,
    //                         shadows: [],
    //                         decoration: TextDecoration.none,
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ],
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
