//
//  MTMapInvokerProtocol.h
//  MapInvoker
//
//  Created by LinXi on 20/04/2017.
//  Copyright © 2017 MT. All rights reserved.
//

#import "MapInvokeParamModel.h"
#import <Foundation/Foundation.h>

@protocol MTMapInvokerProtocol <NSObject>

+ (BOOL)canOpenMapApp;

+ (BOOL)openNaviWithParma:(MapInvokeParamModel *)paramModel;

@end
