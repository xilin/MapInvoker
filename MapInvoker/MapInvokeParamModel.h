//
//  MapInvokeParamModel.h
//  MapInvoker
//
//  Created by LinXi on 20/04/2017.
//  Copyright © 2017 MT. All rights reserved.
//

#import <CoreLocation/CLLocation.h>
#import <Foundation/Foundation.h>

@interface MapInvokeParamModel : NSObject

@property(nonatomic, assign) CLLocationCoordinate2D fromCoordinate2D;
@property(nonatomic, assign) CLLocationCoordinate2D toCoordinate2D;

@property(nonatomic, copy) NSString *fromName;
@property(nonatomic, copy) NSString *toName;

@property(nonatomic, copy) NSString *fromCity;
@property(nonatomic, copy) NSString *toCity;

@end
