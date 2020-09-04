//
//  MainViewController.m
//  FlutterDemo
//
//  Created by ly-yangliu on 2020/9/3.
//  Copyright © 2020 swift. All rights reserved.
//

#import "MainViewController.h"
#import <Flutter/Flutter.h>
#import "FlutterPushOCViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"Flutter";
    self.view.backgroundColor = UIColor.whiteColor;
    
}
- (IBAction)btnAction:(UIButton *)sender {
    NSArray *arr  = @[@"myApp",@"home",@"zujian"];
    [self jumpToFlutter:arr[sender.tag - 1000]];
    
}

- (void)jumpToFlutter:(NSString *)route {
    
    
    
    
    FlutterViewController* flutterViewController = [[FlutterViewController alloc] init];
    //设置路由名字 跳转到不同的flutter界面  void main() => runApp(_widgetForRoute(window.defaultRouteName));
    //home myApp demo
    [flutterViewController setInitialRoute:route];
    __weak __typeof(self) weakSelf = self;
    // 要与main.dart中一致
    NSString *channelName = @"com.pages.your/native_get";
    FlutterMethodChannel *messageChannel = [FlutterMethodChannel methodChannelWithName:channelName binaryMessenger:flutterViewController];
    [messageChannel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
        // call.method 获取 flutter 给回到的方法名，要匹配到 channelName 对应的多个 发送方法名，一般需要判断区分
        // call.arguments 获取到 flutter 给到的参数，（比如跳转到另一个页面所需要参数）
        // result 是给flutter的回调， 该回调只能使用一次
        NSLog(@"method=%@ \narguments = %@", call.method, call.arguments);
        // method和WKWebView里面JS交互很像
        if ([call.method isEqualToString:@"iOSFlutter"]) {
            dispatch_async(dispatch_get_main_queue(), ^{
                FlutterPushOCViewController *vc = [[FlutterPushOCViewController alloc] init];
                vc.parames = call.arguments;
                [weakSelf.navigationController setNavigationBarHidden:NO];
                [weakSelf.navigationController pushViewController:vc animated:YES];
            });
            
        }
        if ([call.method isEqualToString:@"iOSFlutter1"]) {
            NSDictionary *dic = call.arguments;
            NSLog(@"arguments = %@", dic);
            NSString *code = dic[@"code"];
            NSArray *data = dic[@"data"];
            NSLog(@"code = %@", code);
            NSLog(@"data = %@",data);
            NSLog(@"data 第一个元素%@",data[0]);
            NSLog(@"data 第一个元素类型%@",[data[0] class]);
            
        }
        if ([call.method isEqualToString:@"iOSFlutter2"]) {
            if (result) {
                // iOSFlutter2 对应的方法flutter中主动出发 并且将下面的值（Native的值）传给flutter
                result(@"这里传值给flutter kongzichixiangjiaoHHH");
            }
        }
        if ([call.method isEqualToString:@"back"]) {
             dispatch_async(dispatch_get_main_queue(), ^{
                 [weakSelf.navigationController popViewControllerAnimated:YES];
             });
        }
        if (([call.method isEqualToString:@"navBarHidden"])) {
            [weakSelf.navigationController setNavigationBarHidden:YES];
        }
    }];
    [self.navigationController pushViewController:flutterViewController animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:YES];
    [self.navigationController setNavigationBarHidden:YES];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    [self.navigationController setNavigationBarHidden:NO];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
