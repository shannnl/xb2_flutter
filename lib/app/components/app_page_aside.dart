import 'package:flutter/material.dart';

class AppPageAside extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("shannnl"),
            accountEmail: Text("shannnl@qq.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                'https://resources.ninghao.net/wanghao.jpg',
              ),
            ),
          ),
          ListTile(
            title: Text(
              "作品",
              textAlign: TextAlign.right,
            ),
            trailing:
                Icon(Icons.comment_outlined, color: Colors.black26, size: 22),
            onTap: () {},
          ),
          ListTile(
            title: Text(
              "作品",
              textAlign: TextAlign.right,
            ),
            trailing:
                Icon(Icons.comment_outlined, color: Colors.black26, size: 22),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            title: Text(
              "作品",
              textAlign: TextAlign.right,
            ),
            trailing:
                Icon(Icons.comment_outlined, color: Colors.black26, size: 22),
            onTap: () {},
          ),
          ListTile(
            title: Text(
              "作品",
              textAlign: TextAlign.right,
            ),
            trailing:
                Icon(Icons.comment_outlined, color: Colors.black26, size: 22),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            title: Text(
              "作品",
              textAlign: TextAlign.right,
            ),
            trailing:
                Icon(Icons.comment_outlined, color: Colors.black26, size: 22),
            onTap: () {},
          ),
          ListTile(
            title: Text(
              "作品",
              textAlign: TextAlign.right,
            ),
            trailing:
                Icon(Icons.comment_outlined, color: Colors.black26, size: 22),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
