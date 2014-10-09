//
//  AppDelegate.m
//  testing
//
//  Created by Viswa Gopisetty on 24/07/14.
//  Copyright (c) 2014 Viswa Gopisetty. All rights reserved.
//

#import "AppDelegate.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.

    gFirst = [[UITextField alloc]initWithFrame:CGRectMake(50, 50, 100, 50)];
    UITextField *second = [[UITextField alloc]initWithFrame:CGRectMake(170, 50, 100, 50)];
    [gFirst setTag:1];
    [second setTag:2];
    [gFirst setBackgroundColor:[UIColor grayColor]];
    [second setBackgroundColor:[UIColor grayColor]];
    [self.window addSubview:gFirst];
    [self.window addSubview:second];
    
    UILabel *sum = [[UILabel alloc]initWithFrame:CGRectMake(50, 150, 100, 50)];
    [sum setBackgroundColor:[UIColor whiteColor]];
    [sum setTag:3];
    [self.window addSubview:sum];
    
    
    UIButton *add = [[UIButton alloc]initWithFrame:CGRectMake(170, 150, 100, 50)];
    [add setBackgroundColor:[UIColor blackColor]];
    [add setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [add setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [add setTitle:@"ADD" forState:UIControlStateNormal];
    [add setTitle:@"ADD" forState:UIControlStateHighlighted];
    [add setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [add setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [add addTarget:self action:@selector(anyFunction) forControlEvents:UIControlEventTouchUpInside];
    [self.window addSubview:add];
    
    [self sliderMethod];
    
    [self tabBar];
    
    //comment out this block of code if you want to see your calculator
    {
//        FirstViewController *fvc = [[FirstViewController alloc]init];
//        UINavigationController *navController = [[UINavigationController alloc]initWithRootViewController:fvc];
//        self.window.rootViewController = navController;
    }
    
    self.window.backgroundColor = [UIColor blueColor];
    [self.window makeKeyAndVisible];
    return YES;
}

-(void)tabBar {
    SecondViewController *svc = [[SecondViewController alloc]init];
    UINavigationController *nav1 = [[UINavigationController alloc]initWithRootViewController:svc];
    nav1.tabBarItem = [[UITabBarItem alloc]initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:0];
    
    ThirdViewController *tvc = [[ThirdViewController alloc]init];
    UINavigationController *nav2 = [[UINavigationController alloc]initWithRootViewController:tvc];
    nav2.tabBarItem = [[UITabBarItem alloc]initWithTabBarSystemItem:UITabBarSystemItemDownloads tag:1];
    
    UITabBarController *tabBar = [[UITabBarController alloc]init];
    tabBar.viewControllers = [[NSArray alloc]initWithObjects:nav1,nav2, nil];
    self.window.rootViewController = tabBar;
}

-(void)anyFunction {
    UITextField *second = (UITextField *)[self.window viewWithTag:2];
    int a, b;
    
    [gFirst setBackgroundColor:[UIColor cyanColor]];
    a = gFirst.text.intValue;
    b = second.text.intValue;
    
    gFirst.delegate = self;
    second.delegate = self;
    
    NSString *add = [NSString stringWithFormat:@"%d",a + b];
    UILabel *sum = (UILabel *)[self.window viewWithTag:3];
    sum.text = add;

}

-(void)sliderMethod {
    UISlider *slide = [[UISlider alloc] initWithFrame:CGRectMake(50,200, 150, 50)];
    [slide setMaximumValue:1];
    [slide setMinimumValue:0];
    [slide setValue:0.5];
    [slide addTarget:self action:@selector(change:) forControlEvents:UIControlEventValueChanged];
    [slide setBackgroundColor:[UIColor orangeColor]];
    [self.window addSubview:slide];
    
}

-(void)change:(UISlider *)slide {
    int slider = slide.value;
    [gFirst setAlpha:slider];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
