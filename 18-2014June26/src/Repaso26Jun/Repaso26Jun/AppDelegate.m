//
//  AppDelegate.m
//  Repaso26Jun
//
//  Created by metodowhite on 26/06/14.
//  Copyright (c) 2014 metodowhite. All rights reserved.
//

#import "AppDelegate.h"
#import "MWArtist.h"

@interface AppDelegate ()
            

@end

@implementation AppDelegate
            

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
//    MWArtist *art = [[MWArtist alloc]init];
//    
//    art.name = @"Freddie";
//    art.genre = @[@"Classic", @"Rock", @"Pop"];
//    
    
//    MWArtist *art = [[MWArtist alloc] initWithName:@"Freddie"
//                                             genre:@[@"Classic", @"Rock", @"Pop"]
//                                               age:30];
    
    //NSLog(@"%@ %@ %@ %ld", art.name, art.dateField, art.genre, (long)art.age);
    
    //NSLog(@"%@",art);
    

    NSMutableArray *nameArray = [[NSMutableArray alloc] init];
    
    
    
    for (int i = 0; i < 17; i++) {
        MWArtist *art = [[MWArtist alloc] initWithName:@"Freddie"
                                                 genre:@[@"Classic", @"Rock", @"Pop"]
                                                   age:30];
         NSLog(@"%@",art);
        
        [nameArray addObject:art];
        
    }
    
    NSLog(@"%lu", (unsigned long)nameArray.count);
    

    
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}




- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
