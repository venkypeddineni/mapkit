//
//  AppDelegate.h
//  directionsusingmapkit
//
//  Created by apple on 10/10/17.
//  Copyright © 2017 Nadboy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

