import 'package:cardamage_detect/bloc/Insurance/insurance_cubit.dart';
import 'package:cardamage_detect/router/route.dart';
import 'package:cardamage_detect/theme/DesignToken.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InsuranceItem extends StatefulWidget {
  final String insuranceId;
  final String insuranceOwner;
  final String dataId;
  InsuranceItem(
      {@required this.insuranceId,
      @required this.insuranceOwner,
      @required this.dataId});

  @override
  _InsuranceItemState createState() => _InsuranceItemState();
}

class _InsuranceItemState extends State<InsuranceItem> {
  handleOnPress() {
    final insuranceState =
        Provider.of<InsuranceCubit>(context, listen: false).state;
    if (insuranceState is InsuranceLoaded) {
      PageRouter.toPredictPage(
          context, insuranceState.insurance[widget.dataId]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
          primary: Theme.of(context).textTheme.caption.color,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(baseRadius)),
          backgroundColor: Theme.of(context).primaryColor,
          padding: EdgeInsets.zero,
          minimumSize: Size(50, 30),
          alignment: Alignment.centerLeft),
      onPressed: handleOnPress,
      child: Container(
        padding: EdgeInsets.all(16),
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(baseRadius),
            color: Colors.transparent),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  '${widget.insuranceId}',
                  style: Theme.of(context).textTheme.subtitle2,
                  textAlign: TextAlign.left,
                ),
                Text('${widget.insuranceOwner}',
                    style: Theme.of(context).textTheme.caption),
              ],
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: Theme.of(context).textTheme.bodyText2.color,
            )
          ],
        ),
      ),
    );
  }
}
