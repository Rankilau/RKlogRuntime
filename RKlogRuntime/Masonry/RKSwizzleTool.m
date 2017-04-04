//
//  RKSwizzleTool.m
//  RKlogRuntime
//
//  Created by rankilau on 2017/3/31.
//  Copyright © 2017年 rankilau. All rights reserved.
//

#import "RKSwizzleTool.h"
#import <objc/runtime.h>

@implementation RKSwizzleTool

+ (void)RKSwizzleWithClass:(Class)processClass originSelector:(SEL)originSelector swizzleSelector:(SEL)swizzleSelector {
    
    Method originMethod = class_getInstanceMethod(processClass, originSelector);
    Method swizzleMethod = class_getInstanceMethod(processClass, swizzleSelector);
    method_exchangeImplementations(originMethod, swizzleMethod);
}

@end
