import 'package:codepan/resources/dimensions.dart';
import 'package:codepan/widgets/circular.dart';
import 'package:codepan/widgets/icon.dart';
import 'package:codepan/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:track/colors.dart';
import 'package:track/vector.dart';
import 'package:track/widgets/bar_chart.dart';
import 'package:track/widgets/leading_profile_pic.dart';
import 'package:track/widgets/line_chart.dart';
import 'package:track/widgets/non_card_item.dart';
import 'package:track/widgets/sales_card_item.dart';
import 'package:track/widgets/titled_card_item.dart';
import 'package:track/widgets/track_card.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class TrackSalesPage extends StatelessWidget {
  const TrackSalesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final d = Dimension.of(context);
    return Expanded(
      child: ListView(
        clipBehavior: Clip.hardEdge,
        children: [
          const TrackCard(
            title: 'Sales',
            icon: 'hint',
            child: SalesContent(),
          ),
          SizedBox(height: d.at(24)),
          const TrackCard(
            title: 'Sales Report',
            icon: 'hint',
            child: SalesReportContent(),
          ),
          SizedBox(height: d.at(24)),
          const TrackCard(
            title: 'Sales vs Quota',
            icon: 'hint',
            child: SalesVsQuotaContent(),
          ),
          SizedBox(height: d.at(24)),
          NonCardItem(
            title: 'Daily Sales Trend',
            subtitle: ' lower than yesterday',
            value: '10%',
            icon: 'minus',
            iconSize: d.at(16),
            spaceBetween: 0,
            leading: Circular(
              color: AppColors.greenFont,
              diameter: d.at(9),
              margin: EdgeInsets.only(right: d.at(8)),
            ),
          ),
          Divider(height: d.at(28.5)),
          SizedBox(height: d.at(16)),
          const TrackCard(
            title: 'Daily Sales Trend',
            icon: 'hint',
            child: DailySalesTrendContent(),
          ),
          SizedBox(height: d.at(28.5)),
          NonCardItem(
            title: 'Top 10 Stores by Amount',
            subtitle: ' with P 84,002',
            value: 'Grace and Truth',
            icon: 'minus',
            iconSize: d.at(16),
            spaceBetween: 0,
            leading: Circular(
              color: AppColors.greenFont,
              diameter: d.at(9),
              margin: EdgeInsets.only(right: d.at(8)),
            ),
          ),
          Divider(height: d.at(28.5)),
          SizedBox(height: d.at(16)),
          const TrackCard(
            title: 'Top 10 Stores by Amount',
            icon: 'hint',
            child: TopTenStoresContent(),
          ),
          SizedBox(height: d.at(28.5)),
          NonCardItem(
            title: 'Top 10 Stores Performance',
            subtitle: ' reached 80% of their quota',
            value: 'Grace and Truth',
            icon: 'minus',
            iconSize: d.at(16),
            spaceBetween: 0,
          ),
          Divider(height: d.at(28.5)),
          SizedBox(height: d.at(16)),
          const TrackCard(
            title: 'Top 10 Stores by Performance',
            icon: 'hint',
            child: TopTenStoresPerformanceContent(),
          ),
          SizedBox(height: d.at(28.5)),
          NonCardItem(
            title: 'Top 10 Agents by Amount',
            subtitle: ' with P 16,203',
            value: 'Rocelle Dimaano',
            icon: 'minus',
            iconSize: d.at(16),
            spaceBetween: 0,
          ),
          Divider(height: d.at(28.5)),
          SizedBox(height: d.at(16)),
          const TrackCard(
            title: 'Top 10 Agents by Performance',
            icon: "hint",
            child: TopTenAgentsPerformanceContent(),
          ),
          SizedBox(height: d.at(28.5)),
          NonCardItem(
            title: 'Top 10 Agents by Performance',
            subtitle: ' with 70% of quota',
            value: 'Christopher Cruz',
            icon: 'minus',
            iconSize: d.at(16),
            spaceBetween: 0,
          ),
          Divider(height: d.at(28.5)),
          SizedBox(height: d.at(16)),
          const TrackCard(
            title: 'Top 10 Stores by Performance',
            icon: "hint",
            child: TopTenAgentsPerformanceContent(),
          ),
          SizedBox(height: d.at(28.5)),
          NonCardItem(
            title: 'Top 10 Selling SKUs',
            subtitle: ' with P 3,032,001',
            value: 'Cream Silk Pink',
            icon: 'minus',
            iconSize: d.at(16),
            spaceBetween: 0,
          ),
          Divider(height: d.at(28.5)),
          SizedBox(height: d.at(16)),
          const TrackCard(
            title: 'Top 10 Selling SKUs',
            icon: "hint",
            child: TopTenSellingSKUsContent(),
          ),
        ],
      ),
    );
  }
}

class TopTenSellingSKUsContent extends StatelessWidget {
  const TopTenSellingSKUsContent({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      const Vector(x: '1', y: 50),
      const Vector(x: '2', y: 70),
      const Vector(x: '3', y: 72),
      const Vector(x: '4', y: 79),
      const Vector(x: '5', y: 68),
      const Vector(x: '6', y: 84),
      const Vector(x: '7', y: 75),
      const Vector(x: '8', y: 75),
      const Vector(x: '9', y: 75),
      const Vector(x: '10', y: 75),
    ];
    final d = Dimension.of(context);
    return Column(
      children: [
        SizedBox(
          width: d.at(296),
          height: d.at(178),
          child: BarChart(data: data),
        ),
        const SalesCardItem(
          title: 'Cream Silk Pink',
          spaceBetween: 0,
          subtitle: '0930010201',
          value: 'P 3,032,001',
          valueColor: AppColors.blueFont,
          leading: 1,
        ),
        Divider(height: d.at(16)),
        const SalesCardItem(
          title: 'Cream Silk Blue',
          spaceBetween: 0,
          subtitle: 'IAKLS099301',
          value: 'P 3,000,332',
          valueColor: AppColors.blueFont,
          leading: 2,
        ),
        Divider(height: d.at(16)),
        const SalesCardItem(
          title: 'Dove White',
          spaceBetween: 0,
          subtitle: 'ALKSDF12451',
          value: 'P 2,300,001',
          valueColor: AppColors.blueFont,
          leading: 3,
        ),
        Divider(height: d.at(16)),
        const SalesCardItem(
          title: 'Dove Cream',
          spaceBetween: 0,
          subtitle: 'SL1100200011',
          value: 'P 2,220,000',
          valueColor: AppColors.blueFont,
          leading: 4,
        ),
      ],
    );
  }
}

class TopTenAgentsPerformanceContent extends StatelessWidget {
  const TopTenAgentsPerformanceContent({super.key});

  @override
  Widget build(BuildContext context) {
    final d = Dimension.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SalesCardItem(
          title: 'Marie-Anne Yusebio',
          spaceBetween: 0,
          subtitle: 'Team Inspire',
          value: '85%',
          valueColor: AppColors.greenFont,
          leading: LeadingProfilePic(
            leadingText: '1',
            image: 'marie',
            icon: 'first_place',
            frameColor: AppColors.yellowFont,
          ),
        ),
        Divider(height: d.at(16)),
        const SalesCardItem(
          title: 'John Ezekiel Co',
          spaceBetween: 0,
          subtitle: 'Team Strong',
          value: '80%',
          valueColor: AppColors.greenFont,
          leading: LeadingProfilePic(
            leadingText: '2',
            image: 'john',
            icon: 'second_place',
            frameColor: AppColors.grey300,
          ),
        ),
        Divider(height: d.at(16)),
        const SalesCardItem(
          title: 'Claire Renee Voce',
          spaceBetween: 0,
          subtitle: 'Team Inspire',
          value: '79%',
          valueColor: AppColors.greenFont,
          leading: LeadingProfilePic(
            leadingText: '3',
            image: 'claire',
            icon: 'third_place',
            frameColor: AppColors.orange1,
          ),
        ),
        Divider(height: d.at(16)),
        const SalesCardItem(
          title: 'Rhudith Dimabulong',
          spaceBetween: 0,
          subtitle: 'Team Inspire',
          value: '78%',
          valueColor: AppColors.greenFont,
          leading: LeadingProfilePic(
            leadingText: '4',
            image: 'rhudith',
          ),
        ),
      ],
    );
  }
}

class TopTenStoresPerformanceContent extends StatelessWidget {
  const TopTenStoresPerformanceContent({super.key});

  @override
  Widget build(BuildContext context) {
    final d = Dimension.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SalesCardItem(
            title: 'Grace and Truth',
            spaceBetween: 0,
            titleIcon: PanIcon(
              icon: 'first_place',
              width: d.at(16),
              height: d.at(16),
            ),
            subtitle: 'Sta. Cruz City, Laguna',
            value: '80%',
            valueColor: AppColors.greenFont,
            leading: 1),
        Divider(height: d.at(16)),
        SalesCardItem(
            title: 'John Ezekiel Company',
            spaceBetween: 0,
            titleIcon: PanIcon(
              icon: 'second_place',
              width: d.at(16),
              height: d.at(16),
            ),
            subtitle: 'Sta. Cruz City, Laguna',
            value: '70%',
            valueColor: AppColors.greenFont,
            leading: 2),
        Divider(height: d.at(16)),
        SalesCardItem(
            title: 'ABC store',
            spaceBetween: 0,
            titleIcon: PanIcon(
              icon: 'third_place',
              width: d.at(16),
              height: d.at(16),
            ),
            subtitle: 'Sta. Cruz City, Laguna',
            value: '68%',
            valueColor: AppColors.greenFont,
            leading: 3),
        Divider(height: d.at(16)),
        const SalesCardItem(
            title: 'Aling Marites Store',
            spaceBetween: 0,
            subtitle: 'Sta. Cruz City, Laguna',
            value: '65%',
            valueColor: AppColors.greenFont,
            leading: 4),
      ],
    );
  }
}

class TopTenStoresContent extends StatelessWidget {
  const TopTenStoresContent({super.key});

  @override
  Widget build(BuildContext context) {
    final d = Dimension.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SalesCardItem(
            title: 'Grace and Truth',
            spaceBetween: 0,
            titleIcon: PanIcon(
              icon: 'first_place',
              width: d.at(16),
              height: d.at(16),
            ),
            subtitle: 'Sta. Cruz City, Laguna',
            value: 'P 84,002',
            valueColor: AppColors.blueFont,
            leading: 1),
        Divider(height: d.at(16)),
        SalesCardItem(
            title: 'John Ezekiel Company',
            spaceBetween: 0,
            titleIcon: PanIcon(
              icon: 'second_place',
              width: d.at(16),
              height: d.at(16),
            ),
            subtitle: 'Sta. Cruz City, Laguna',
            value: 'P 14,203',
            valueColor: AppColors.blueFont,
            leading: 2),
        Divider(height: d.at(16)),
        SalesCardItem(
            title: 'ABC store',
            spaceBetween: 0,
            titleIcon: PanIcon(
              icon: 'third_place',
              width: d.at(16),
              height: d.at(16),
            ),
            subtitle: 'Sta. Cruz City, Laguna',
            value: 'P 12,553',
            valueColor: AppColors.blueFont,
            leading: 3),
        Divider(height: d.at(16)),
        const SalesCardItem(
            title: 'Aling Marites Store',
            spaceBetween: 0,
            subtitle: 'Sta. Cruz City, Laguna',
            value: 'P 12,203',
            valueColor: AppColors.blueFont,
            leading: 4),
      ],
    );
  }
}

class SalesContent extends StatelessWidget {
  const SalesContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        TitledCardItem(
          icon: 'money',
          value: 'P 5,673.50',
          subtitle: '+5% increase vs last month',
          iconColor: AppColors.greenFont,
        ),
      ],
    );
  }
}

class SalesReportContent extends StatelessWidget {
  const SalesReportContent({super.key});

  @override
  Widget build(BuildContext context) {
    final d = Dimension.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitledCardItem(
          icon: 'calendar',
          value: 'P 5,224.23',
          title: 'Today',
          iconColor: AppColors.blueShadow,
        ),
        SizedBox(height: d.at(12)),
        const TitledCardItem(
          icon: 'check',
          value: 'P 25,673.50',
          title: 'This Month',
          iconColor: AppColors.greenFont,
        ),
        SizedBox(height: d.at(12)),
      ],
    );
  }
}

class SalesVsQuotaContent extends StatelessWidget {
  const SalesVsQuotaContent({super.key});

  @override
  Widget build(BuildContext context) {
    final d = Dimension.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PanText(
          text: '44%',
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w700,
          fontColor: AppColors.blueFont,
          fontSize: d.at(32),
        ),
        PanText(
          text: 'TRACKING BELOW',
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w700,
          fontColor: AppColors.yellowFont,
          fontSize: d.at(10),
        ),
        SizedBox(height: d.at(16)),
        LinearPercentIndicator(
          padding: EdgeInsets.zero,
          barRadius: const Radius.circular(4),
          width: d.at(280),
          lineHeight: d.at(19),
          percent: 0.44,
          progressColor: AppColors.yellowFont,
          backgroundColor: const Color(0xFFE2E8ED),
        ),
        SizedBox(height: d.at(2)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PanText(
                text: 'P 5,224.23',
                fontSize: d.at(8),
                fontWeight: FontWeight.w400,
                fontFamily: 'Poppins',
                fontColor: AppColors.grey300),
            PanText(
                text: 'P 11,200.00',
                fontSize: d.at(8),
                fontWeight: FontWeight.w400,
                fontFamily: 'Poppins',
                fontColor: AppColors.grey300),
          ],
        ),
        SizedBox(height: d.at(12)),
        Row(
          children: [
            PanText(
              text: 'P 5,975.77',
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
              fontSize: d.at(10),
              fontColor: AppColors.blueFont,
            ),
            PanText(
              text: ' until your quota',
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              fontSize: d.at(10),
              fontColor: AppColors.blueFont,
            ),
          ],
        )
      ],
    );
  }
}

class DailySalesTrendContent extends StatelessWidget {
  const DailySalesTrendContent({super.key});

  @override
  Widget build(BuildContext context) {
    final d = Dimension.of(context);
    final data = [
      const Vector(x: 'MON', y: 50),
      const Vector(x: 'TUE', y: 70),
      const Vector(x: 'WED', y: 72),
      const Vector(x: 'THU', y: 79),
      const Vector(x: 'FRI', y: 68),
      const Vector(x: 'SAT', y: 84),
      const Vector(x: 'SUN', y: 75),
    ];
    return SizedBox(
      width: d.at(296),
      height: d.at(178),
      child: LineChart(data: data),
    );
  }
}

