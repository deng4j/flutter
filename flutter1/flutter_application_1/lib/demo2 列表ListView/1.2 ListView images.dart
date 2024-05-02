import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text("女也"),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: const Myapp(),
    ),
  ));
}

class Myapp extends StatelessWidget {
  const Myapp();

  @override
  Widget build(BuildContext context) {
    return ListView(
      // 放入Widget类型组件即可
      children: <Widget>[
        ListTile(
          title: Text("张靓颖（Jane Zhang）"),
          leading: Image.network(
              "https://bkimg.cdn.bcebos.com/pic/4e4a20a4462309f79052e806c15b1bf3d7ca7bcb78d3?x-bce-process=image/format,f_auto/watermark,image_d2F0ZXIvYmFpa2UyNzI,g_7,xp_5,yp_5,P_20/resize,m_lfit,limit_1,h_1080"),
          subtitle: Text(
              "张靓颖（Jane Zhang），1984年10月11日出生于四川省成都市，中国内地流行乐女歌手、词曲作者、音乐制作人。2005年，参加湖南卫视选秀节目《2005超级女声》获得季军出道。2006年，发行首张录音室专辑《The One》，凭该专辑获得中国金唱片奖。2007年，在美国洛杉矶举行个人售票演唱会。2008年，在日本首相官邸举行的活动中献唱歌曲《印象西湖雨》。"),
        ),
        const Divider(),
        ListTile(
          title: Text("黄丽玲（A-Lin）"),
          leading: Image.network(
              "https://bkimg.cdn.bcebos.com/pic/b812c8fcc3cec3fd48799b40d888d43f879427bb?x-bce-process=image/format,f_auto/watermark,image_d2F0ZXIvYmFpa2UyNzI,g_7,xp_5,yp_5,P_20/resize,m_lfit,limit_1,h_1080"),
          subtitle: Text(
              "黄丽玲（A-Lin），1983年9月20日出生于台湾省台东市，中国台湾女歌手。1999年，黄丽玲在南投教921地震后的小朋友们唱诗歌时被经纪人发现。2003年，签约艾回唱片并正式出道。2007年，凭借个人第一张专辑《失恋无罪》获得第18届台湾金曲奖最佳新人奖提名。2009年，黄丽玲凭借音乐专辑《天生歌姬》第一次获得第20届台湾金曲奖最佳国语女歌手奖提名。"),
        ),
        const Divider(),
        ListTile(
          title: Text("徐佳莹（Lala Hsu）"),
          leading: Image.network(
              "https://bkimg.cdn.bcebos.com/pic/b812c8fcc3cec3fd9816c9e8da88d43f87942706?x-bce-process=image/format,f_auto/watermark,image_d2F0ZXIvYmFpa2UyNzI,g_7,xp_5,yp_5,P_20/resize,m_lfit,limit_1,h_1080"),
          subtitle: Text("""
            徐佳莹（Lala Hsu），1984年12月20日生于台湾省花莲县，祖籍四川省简阳市，中国台湾流行乐女歌手、词曲创作人，毕业于中台科技大学护理系。
            1992年，小学时期的徐佳莹开始学习钢琴，并跟着姐姐一起喜欢偶像郭富城、刘德华以及小虎队，同时也开始喜欢流行音乐，因此也开始了自己的音乐人生。
          """),
        ),
        const Divider(),
        ListTile(
          title: Text("田馥甄（Hebe Tien）"),
          leading: Image.network(
              "https://bkimg.cdn.bcebos.com/pic/4034970a304e251f3327dfa8a486c9177e3e5389?x-bce-process=image/format,f_auto/watermark,image_d2F0ZXIvYmFpa2UyNzI,g_7,xp_5,yp_5,P_20/resize,m_lfit,limit_1,h_1080"),
          subtitle: Text("""
           田馥甄（Hebe Tien），1983年3月30日出生于中国台湾省新竹县，华语流行乐女歌手、影视演员，女子演唱组合S.H.E成员之一。
           2000年，田馥甄参加“宇宙2000实力美少女选拔大赛”；赛后，与参赛成员任家萱、陈嘉桦共同签约华研国际音乐，组成演唱组合“S.H.E”正式出道。
          """),
        ),
        const Divider(),
        ListTile(
          title: Text("孙燕姿（Stefanie Sun）"),
          leading: Image.network(
              "https://bkimg.cdn.bcebos.com/pic/38dbb6fd5266d0160924c3e4cb73c30735fae7cd9ffd?x-bce-process=image/format,f_auto/quality,Q_70/resize,m_lfit,limit_1,w_536"),
          subtitle: Text("""
           1978年7月23日出生于新加坡，祖籍广东省潮州市，毕业于新加坡南洋理工大学，流行乐女歌手、音乐制作人。
           2000年6月9日，孙燕姿推出了个人首张专辑《孙燕姿》，正式出道踏入乐坛，并获得第12届台湾金曲奖最佳新人奖，主打歌《天黑黑》登上各大音乐排行榜，被视为华语歌坛继王菲、张惠妹后的天后接班人，与同期出道的蔡依林、萧亚轩、梁静茹合称亚洲四小天后；
          """),
        ),
        const Divider(),
        ListTile(
          title: Text("邓紫棋（G.E.M.）"),
          leading: Image.network(
              "https://bkimg.cdn.bcebos.com/pic/902397dda144ad3493f92797dea20cf431ad8558?x-bce-process=image/format,f_auto/resize,m_lfit,limit_1,h_300"),
          subtitle: Text("""
           本名邓诗颖，1991年8月16日出生于上海市，华语流行乐女歌手、词曲作者、音乐制作人。2008年，发行个人首张EP《G.E.M.》。2009年，发行音乐专辑《18》。
           2011年，成为首位登上香港红馆开唱的90后女歌手。2013年，凭借专辑《Xposed》提名第24届台湾金曲奖“最佳国语女歌手奖”，并获得IFPI香港唱片销量大奖“全年最高销量女歌手奖”。
          """),
        ),
      ],
    );
  }
}
