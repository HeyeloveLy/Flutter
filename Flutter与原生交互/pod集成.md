# pod集成 flutter

cd some/path/
flutter create -t module my_flutterDemo


Podfile 文件
#注意路径和文件夹名字正确无误 最后有一个反斜杠
flutter_application_path = '../my_flutterDemo/'
load File.join(flutter_application_path, '.iOS', 'Flutter', 'podhelper.rb')

target 'FlutterDemo' do
  
install_all_flutter_pods(flutter_application_path)
end


pod install


 注意，如下错误：[!] InvalidPodfilefile: No such file or directory @ rb_sysopen - ./flutter_yyframework/.ios/Flutter/podhelper.rb.

需要在my_flutterDemo文件夹下执行以下命令，把.ios和.android等flutter配置生成出来。（打开模拟器。链接真机都可以。）

open -a Simulator
flutter run


注意，如下错误是因为路径不对。
[!] Invalid `Podfile` file: cannot load such file -- path/to/flutter_yyframework/.ios/Flutter/podhelper.rb.
#  from /Users/houjianan/Documents/GitHub/iOS/YYFramework/Podfile:7
#  -------------------------------------------
#  flutter_application_path = 'path/to/flutter_yyframework/'
>  load File.join(flutter_application_path, '.ios', 'Flutter', 'podhelper.rb')
#
#  -------------------------------------------
