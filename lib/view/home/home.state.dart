import 'package:cardamage_detect/bloc/Insurance/insurance_cubit.dart';
import 'package:cardamage_detect/models/insurance.dart';
import 'package:cardamage_detect/theme/DesignToken.dart';
import 'package:cardamage_detect/view/home/home.dart';
import 'package:cardamage_detect/widgets/Insurance.dart';
import 'package:cardamage_detect/widgets/LoaddingScreen.dart';
import 'package:cardamage_detect/widgets/Navbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePageState extends State<HomePage> {
  Future<void> handleRefresh() async {
    await Provider.of<InsuranceCubit>(context, listen: false).refresh();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final insuranceState = Provider.of<InsuranceCubit>(context).state;
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: handleRefresh,
          child: Container(
            padding: EdgeInsets.only(top: 16, left: 24, right: 24),
            child: Column(
              children: [
                Navbar(),
                SizedBox(
                  height: 24,
                ),
                Container(
                  child: Text(
                    'Insurances',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  alignment: Alignment.centerLeft,
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                    child: insuranceState is InsuranceLoaded
                        ? Flexible(
                            child: ListView(
                              children: [
                                for (var item
                                    in insuranceState.insurance.entries)
                                  Container(
                                    padding: EdgeInsets.only(top: 4, bottom: 4),
                                    child: InsuranceItem(
                                      insuranceId: item.value.insuranceId,
                                      insuranceOwner: item.value.name,
                                      dataId: item.key,
                                    ),
                                  )
                              ],
                            ),
                          )
                        : insuranceState is InsuranceLoading
                            ? LoadingScreen()
                            : null)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
