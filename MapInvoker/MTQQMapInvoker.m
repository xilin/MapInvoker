//
//  MTQQMapInvoker.m
//  MapInvoker
//
//  Created by LinXi on 20/04/2017.
//  Copyright © 2017 MT. All rights reserved.
//

#import "MTQQMapInvoker.h"
#import "UIApplication+Helper.h"

@implementation MTQQMapInvoker

+ (BOOL)openNaviWithParma:(MapInvokeParamModel *)paramModel {
  if (![self canOpenMapApp]) {
    return NO;
  }
  NSString *invokeString = [NSString
      stringWithFormat:@"qqmap://map/"
                       @"routeplan?type=drive&fromcoord=%f,%f&from=%@&tocoord="
                       @"%f,%f&to=%@&policy=0",
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
      canOpenURL:[NSURL URLWithString:@"qqmap://"]];
}

@end
