/*
 * Copyright (C) 2013-2015 Bilibili
 * Copyright (C) 2013-2015 Zhang Rui <bbcallen@gmail.com>
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#import "IJKAppDelegate.h"
#import "IJKDemoMainViewController.h"

void testMehod();

@implementation IJKAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    testMehod();
//    BOOL isEven = NO;
//    if ((isEven = testMehod(4))) {
//        NSLog(@"YES");
//    }else{
//        NSLog(@"NO");
//    }
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:[[IJKDemoMainViewController alloc] init]];
    
    self.viewController = navigationController;
    self.window.rootViewController = self.viewController;

    [self.window makeKeyAndVisible];
    
    return YES;
}

#define MKTAG(a,b,c,d) ((a) | ((b) << 8) | ((c) << 16) | ((unsigned)(d) << 24))
#define MKBETAG(a,b,c,d) ((d) | ((c) << 8) | ((b) << 16) | ((unsigned)(a) << 24))

void testMehod(){
    NSMutableArray <NSString *> *boxTypeArray = [NSMutableArray array];
    [boxTypeArray addObject:@"ftyp"];
    UInt32 value = MKTAG('f', 't', 'y', 'p');
    for (int index = 0; index < boxTypeArray.count; index ++) {
        NSString *type = boxTypeArray[index];
        unsigned char temp[type.length];
        for (NSInteger subIndex = type.length-1; subIndex >= 0; subIndex --) {
            temp[type.length - subIndex - 1] = *[type substringWithRange:NSMakeRange(subIndex, 1)].UTF8String;
        }
        
        unsigned char otherTemp[type.length];
        for (NSInteger subIndex = 0; subIndex < type.length; subIndex ++) {
            otherTemp[subIndex] = *[type substringWithRange:NSMakeRange(subIndex, 1)].UTF8String;
        }
        
        NSLog(@"type=[%@][%u][%u][%u]", type, *(UInt32 *)temp, *(UInt32 *)otherTemp, value);
    }
    
    
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
