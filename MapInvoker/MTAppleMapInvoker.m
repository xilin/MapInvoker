//
//  MTAppleMapInvoker.m
//  MapInvoker
//
//  Created by LinXi on 20/04/2017.
//  Copyright © 2017 MT. All rights reserved.
//

#import "MTAppleMapInvoker.h"
#import <AddressBook/ABPerson.h>
#import <MapKit/MapKit.h>

@implementation MTAppleMapInvoker

+ (BOOL)openNaviWithParma:(MapInvokeParamModel *)paramModel {
  MKMapItem *currentLocation = [[MKMapItem alloc]
      initWithPlacemark:[[MKPlacemark alloc]
                            initWithCoordinate:paramModel.fromCoordinate2D
                             addressDictionary:nil]];
  currentLocation.name = paramModel.fromName;

  MKMapItem *toLocation = [[MKMapItem alloc]
      initWithPlacemark:[[MKPlacemark alloc]
                            initWithCoordinate:paramModel.toCoordinate2D
                             addressDictionary:nil]];
  toLocation.name = paramModel.toName;
  return [MKMapItem openMapsWithItems:@[ currentLocation, toLocation ]
                        launchOptions:@{
                          MKLaunchOptionsDirectionsModeKey :
                              MKLaunchOptionsDirectionsModeDriving
                        }];
}

+ (BOOL)canOpenMapApp {
  return YES;
}

@end
