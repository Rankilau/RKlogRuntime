//
//  RKSwizzleTool.h
//  RKlogRuntime
//
//  Created by rankilau on 2017/3/31.
//  Copyright © 2017年 rankilau. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RKSwizzleTool : NSObject

+ (void)RKSwizzleWithClass:(Class)processClass originSelector:(SEL)originSelector swizzleSelector:(SEL)swizzleSelector;

@end
