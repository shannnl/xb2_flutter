import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) { 
    return Center(
      child: Container( 
        // color: Colors.white, 
        padding: EdgeInsets.all(60), 
        alignment: Alignment.topCenter, 
        width: 350, 
        height: 350, 

        decoration: BoxDecoration(
          // color: Colors.deepPurpleAccent,
          gradient: LinearGradient( 
            begin: Alignment.topLeft, 
            end: Alignment.bottomRight, 
            colors: [ 
              Colors.yellow, 
              Colors.pink, 
              Colors.blue, 
              Colors.cyan, 
              ], 
            ),
          borderRadius: BorderRadius.all( 
          Radius.circular(25), 
          ),

          border: Border.all( 
            color: Colors.deepOrangeAccent,
             width: 5, 
             style: BorderStyle.solid, 
             ),
             
          boxShadow: [ 
          BoxShadow( 
            color: Colors.deepOrangeAccent,
            offset: Offset(5, 20), 
            blurRadius: 30, 
            ), 
            ],


        ), 

        
        child: Image.asset(
          'assets/images/logo.png',
          width: 96, 
        ),
      ), 
      );
  }
}



//       child: ColoredBox( 
//         color: Colors.purple.shade900, 
//         child: Padding(
//           padding: const EdgeInsets.all(60.0),
//           child: Image.asset('assets/images/logo.png'),
//           )        
//       ),
//     );
//   }
// }


// child: ColoredBox( 
//         color: Colors.purple.shade900, 
//         child: Image.asset('assets/images/logo.png'),
//       ),
//     );
//   }
// }



//       child: Container(
//         color: Colors.deepPurpleAccent,
//         padding: EdgeInsets.all(60),
//         alignment: Alignment.topCenter,
//         width:350,
//         height: 350,
//         transform: Matrix4.rotationZ(0.5),
//         transformAlignment: Alignment.topRight,
//         child: Image.asset(
//         'assets/images/logo.png',
//         width:96,
//         color:Colors.white,
//       ),
//       ),
//     );
//   }
// }



//       child: Image( 
//         image: NetworkImage( 'https://resources.ninghao.net/images/IMG_2490.JPG',
//         ),
//         // width: 350,
//         // height: 350,
//         // fit:BoxFit.cover,
//         alignment: Alignment.bottomRight,
//         color: Colors.brown,
//         colorBlendMode: BlendMode.softLight,
//       ),
//     );
//   }
// }



//       child: Image.asset(
//         'assets/images/logo.png',
//         width:128,
//       ),
//     );
//   }
// }


//       child: Image(
//         image: AssetImage('assets/images/logo.png'),
//         ),
//     );
//   }
// }



//       child: RichText(
//         textDirection: TextDirection.ltr,
//         text: TextSpan(
//           text:'版权声明', 
//           style: TextStyle(
//             fontSize: 22.0,
//           ),
//           children: [
//             TextSpan(
//               text: "本文内容",
//               style: TextStyle( 
//                 color: Colors.pinkAccent, 
//                 fontWeight: FontWeight.bold, 
//                 ),
//             ),
//             TextSpan(
//               text: "由阿里云天池用户自发贡献"

//             )
//           ]
//         ),
//       ),
//     );
//   }
// }


//   Widget build(BuildContext context) { 
//     return Center( 
//       child: Text( 
//         '版权声明：本文内容由阿里云天池用户自发贡献，版权归原作者所有，天池社区不拥有其著作权，亦不承担相应法律责任。如果您发现本社区中有涉嫌抄袭的内容，填写侵权投诉表单进行举报，一经查实，本社区将立刻删除涉嫌侵权内容。', 
//         textDirection: TextDirection.ltr,
//         style: TextStyle( 
//           fontSize: 22.0, 
//         ), 
//         textAlign: TextAlign.center,
//         maxLines: 1, 
//         overflow: TextOverflow.ellipsis,
//         ), 
//         );

// }

// }