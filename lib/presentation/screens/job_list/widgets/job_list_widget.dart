import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:parsowa/core/constants/colors.dart';
import 'package:parsowa/presentation/screens/job_detail/content/content_screen.dart';
import 'package:parsowa/presentation/screens/job_list/data/job_list_data.dart';

class JobListWidget extends StatelessWidget {
  const JobListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class JobListBodyWidget extends StatelessWidget {
  final List<JobData> data;
  const JobListBodyWidget({Key? key, required this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: AppColors.jobListBodyColor,
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ContentJobDetailScreen.routeName,
              arguments: data[index],
            );
          },
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
            margin: index == 0
                ? const EdgeInsets.all(10)
                : const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
            decoration: const BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.all(Radius.circular(5.0))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data[index].officeName,
                  style: const TextStyle(
                      fontFamily: 'NotoSanJP',
                      fontSize: 16.0,
                      color: AppColors.unselectedColor,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 17),
                Text(
                  data[index].title,
                  style: const TextStyle(
                      fontFamily: 'NotoSanJP',
                      fontSize: 19.0,
                      color: AppColors.unselectedColor,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                _buildRow(context, 'assets/icons/icon_svg/Mypage_icon.svg',
                    data[index].userInformation),
                _buildRow(context, 'assets/icons/icon_svg/Workplace_icon.svg',
                    data[index].workLocation),
                _buildRow(
                    context,
                    'assets/icons/icon_svg/working_days_icon.svg',
                    data[index].workingDay),
                _buildRow(context, 'assets/icons/icon_svg/Working_hours.svg',
                    data[index].workingHours),
                Container(
                  alignment: Alignment.centerRight,
                  child: RichText(
                    text: TextSpan(
                        text: data[index].remuneration,
                        style: const TextStyle(
                          fontFamily: 'NotoSanJP',
                          fontSize: 34.0,
                          color: AppColors.unselectedColor,
                          fontWeight: FontWeight.w700,
                        ),
                        children: const [
                          TextSpan(
                              text: '円/日',
                              style: TextStyle(
                                fontFamily: 'NotoSanJP',
                                fontSize: 20.0,
                                color: AppColors.unselectedColor,
                                fontWeight: FontWeight.w700,
                              )),
                        ]),
                  ),
                ),
                Wrap(
                  children: _buildTag(data[index]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRow(BuildContext context, String uriIcon, String content) => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            uriIcon,
            width: 16.0,
            height: 16.0,
            color: const Color(0xff9d9d9d),
            alignment: Alignment.center,
            fit: BoxFit.fill,
          ),
          const SizedBox(
            width: 9.0,
          ),
          Text(
            content,
            style: const TextStyle(
                fontFamily: 'NotoSanJP',
                fontSize: 16.0,
                color: AppColors.unselectedColor,
                fontWeight: FontWeight.w400),
          ),
        ],
      );
  List<Widget> _buildTag(JobData job) {
    return job.tagList
        .map((tag) => Container(
              margin: const EdgeInsets.only(right: 5.0, top: 10),
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              decoration: const BoxDecoration(
                  color: Color(0xfff2f2f2),
                  borderRadius: BorderRadius.all(Radius.circular(3))),
              child: Text(
                tag,
                style: const TextStyle(
                    fontFamily: 'NotoSanJP',
                    fontSize: 12.0,
                    color: Color(0xff616161),
                    fontWeight: FontWeight.w400),
              ),
            ))
        .toList();
  }
}
