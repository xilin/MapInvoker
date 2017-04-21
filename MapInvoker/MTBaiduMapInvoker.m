//
//  MTBaiduMapInvoker.m
//  MapInvoker
//
//  Created by LinXi on 20/04/2017.
//  Copyright © 2017 MT. All rights reserved.
//

#import "MTBaiduMapInvoker.h"
#import "UIApplication+Helper.h"
#import <UIKit/UIKit.h>

@implementation MTBaiduMapInvoker

+ (BOOL)openNaviWithParma:(MapInvokeParamModel *)paramModel {
  if (![self canOpenMapApp]) {
    return NO;
  }
  NSString *invokeString =
      [NSString
          stringWithFormat:
              @"baidumap://map/direction"
              @"?origin=name:%@|latlng:%f,%f&destination=name:%@|"
              @"latlng:%f,%f&mode=driving&origin_region=%@&destination_region=%@",
              paramModel.fromName,
              paramModel.fromCoordinate2D.latitude,
              paramModel.fromCoordinate2D.longitude, paramModel.toName,
              paramModel.toCoordinate2D.latitude,
              paramModel.toCoordinate2D.longitude, paramModel.fromCity,
              paramModel.toCity];
  NSURL *invokeURL = [NSURL
      URLWithString:[invokeString stringByAddingPercentEscapesUsingEncoding:
                                      NSUTF8StringEncoding]];
  return [[UIApplication sharedApplication] mt_openURL:invokeURL];
}

+ (BOOL)canOpenMapApp {
  return [[UIApplication sharedApplication]
      canOpenURL:[NSURL URLWithString:@"baidumap://"]];
}

@end
