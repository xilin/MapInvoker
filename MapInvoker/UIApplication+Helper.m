//
//  UIApplication+Helper.m
//  MapInvoker
//
//  Created by LinXi on 20/04/2017.
//  Copyright © 2017 MT. All rights reserved.
//

#import "UIApplication+Helper.h"

@implementation UIApplication (Helper)

- (BOOL)mt_openURL:(NSURL *)openURL {
  if ([[UIDevice currentDevice].systemVersion integerValue] >= 10) {
    [self openURL:openURL
        options:@{}
        completionHandler:^(BOOL success){

        }];
    return YES;
  } else {
    return [self openURL:openURL];
  }
}

@end
