//
//  AppDelegate.h
//  temps
//
//  Created by Louis-Simon Poulin on 2018-03-20.
//  Copyright © 2018 Louis-Simon Poulin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

