//
//  MTAMapInvoker.m
//  MapInvoker
//
//  Created by LinXi on 20/04/2017.
//  Copyright © 2017 MT. All rights reserved.
//

#import "MTAMapInvoker.h"
#import "UIApplication+Helper.h"
#import <UIKit/UIKit.h>

@implementation MTAMapInvoker

+ (BOOL)openNaviWithParma:(MapInvokeParamModel *)paramModel {
  if (![self canOpenMapApp]) {
    return NO;
  }
  NSString *invokeString = [NSString
      stringWithFormat:@"iosamap://path?"
                       @"slat=%f&slon=%f&sname=%@"
                       @"&dlat=%f&dlon=%f&dname=%@&t=0",
                       paramModel.fromCoordinate2D.latitude,
                       paramModel.fromCoordinate2D.longitude,
                       paramModel.fromName, paramModel.toCoordinate2D.latitude,
                       paramModel.toCoordinate2D.longitude, paramModel.toName];
  NSURL *invokeURL = [NSURL
      URLWithString:[invokeString stringByAddingPercentEscapesUsingEncoding:
                                      NSUTF8StringEncoding]];
  return [[UIApplication sharedApplication] mt_openURL:invokeURL];
}

+ (BOOL)canOpenMapApp {
  return [[UIApplication sharedApplication]
      canOpenURL:[NSURL URLWithString:@"iosamap://"]];
}

@end
