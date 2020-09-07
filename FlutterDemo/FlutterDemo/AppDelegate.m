//
//  AppDelegate.m
//  FlutterDemo
//
//  Created by ly-yangliu on 2020/9/3.
//  Copyright © 2020 swift. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
@interface AppDelegate (){
    FlutterPluginAppLifeCycleDelegate*_lifeCycleDelegate ;
}
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    MainViewController *home = [[MainViewController alloc] init];
//    home.view.backgroundColor = [UIColor yellowColor];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:home];
//    [navController.navigationBar setBackgroundColor:[UIColor blueColor]];
    [self.window setRootViewController:navController];
    [self.window makeKeyAndVisible];
    
    return YES;
}


//MARK: - -- FlutterAppLifeCycleProvider --
- (void)addApplicationLifeCycleDelegate:(nonnull NSObject<FlutterPlugin> *)delegate {
    [_lifeCycleDelegate addDelegate:delegate];
}
//MARK - Flutter
// Returns the key window's rootViewController, if it's a FlutterViewController.
// Otherwise, returns nil.
- (FlutterViewController*)rootFlutterViewController {
    
    UIViewController* viewController = [[UIApplication sharedApplication].windows firstObject].rootViewController;
    if([viewController isKindOfClass:[FlutterViewController class]]) {
        return(FlutterViewController*)viewController;
    }
    return nil;
}
- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event {
    [super touchesBegan:touches withEvent:event];
    // Pass status bar taps to key window Flutter rootViewController.
    if(self.rootFlutterViewController!= nil) {
//        [self.rootFlutterViewController handleStatusBarTouches:event];
    }
}


@end
