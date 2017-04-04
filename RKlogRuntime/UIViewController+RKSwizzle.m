//
//  UIViewController+RKSwizzle.m
//  RKlogRuntime
//
//  Created by rankilau on 2017/4/1.
//  Copyright © 2017年 rankilau. All rights reserved.
//

#import "UIViewController+RKSwizzle.h"
#import <objc/runtime.h>
#import "RKSwizzleTool.h"

@implementation UIViewController (RKSwizzle)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL originSel = @selector(viewWillAppear:);
        SEL swizzleSel = @selector(swizzleViewWillAppear:);
        [RKSwizzleTool RKSwizzleWithClass:[self class] originSelector:originSel swizzleSelector:swizzleSel];
        
    });
}

- (void)swizzleViewWillAppear:(BOOL)animation {
    //初始化要上报的日志
    NSMutableDictionary *logDic = [[NSMutableDictionary alloc]init];
    
    [logDic setObject:NSStringFromClass([self class]) forKey:@"className"];
    if ([logDic allKeys].count) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"showLogResult" object:logDic];
        NSLog(@"上传的logDic:%@",logDic);
    }

}

@end
