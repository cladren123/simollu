import 'package:flutter/material.dart';
import 'package:simollu_front/widgets/custom_appBar.dart';
import 'package:intl/intl.dart';

class ForkRewardPage extends StatefulWidget {
  const ForkRewardPage({Key? key}) : super(key: key);

  @override
  State<ForkRewardPage> createState() => _ForkRewardPageState();
}

class _ForkRewardPageState extends State<ForkRewardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 없앨 예정
      appBar: CustomAppBar(
        title: '포크 사용 내역',
        leading: Icon(Icons.arrow_back),
        actions: [
          Icon(Icons.no_accounts)
        ],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: Colors.white,
            height: 100,
            child: FractionallySizedBox(
              widthFactor: 0.9,
              heightFactor: 0.7,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black12,
                  ),
                  borderRadius: BorderRadius.circular(5)
                ),

                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset('assets/icons/Fork_small.png',),
                          SizedBox(width: 10,),
                          Text('보유 포크'),
                        ],
                      ),
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(text: "2000", style: TextStyle(color: Colors.amber)),
                            TextSpan(text: "개")
                          ]
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: Container(
              color: Colors.white,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _ForkHistory(
                      rewardDate: '23/04/18 (월)',
                      rewardAmount: 2000,
                      rewardState: '적립',
                    ),
                    _ForkHistory(
                      rewardDate: '23/04/17 (화)',
                      rewardAmount: 1999,
                      rewardState: '포인트 사용',
                    ),
                    _ForkHistory(
                      rewardDate: '23/04/18',
                      rewardAmount: 1996,
                      rewardState: '포인트 사용',
                    ),
                    _ForkHistory(
                      rewardDate: '23/04/18',
                      rewardAmount: 1993,
                      rewardState: '포인트 사용',
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      )
    );
  }
}

class _ForkHistory extends StatelessWidget {
  final String rewardDate;
  final String rewardState;
  final int rewardAmount;

  const _ForkHistory({
    required this.rewardDate,
    required this.rewardState,
    required this.rewardAmount,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.93,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.black12,
              width: 0.5
            )
          )
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
          child: Column(
            children: [
              Row(
                children: [
                  Text('$rewardDate | ', style: TextStyle(color: Colors.grey), textAlign: TextAlign.left,),
                  Text(rewardState, style: TextStyle(color: Colors.amber)),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('${NumberFormat('###,###,###,###').format(rewardAmount)}개')
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}