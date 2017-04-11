//
//  UIControl+RKSwizzle.m
//  RKlogRuntime
//
//  Created by rankilau on 2017/3/30.
//  Copyright © 2017年 rankilau. All rights reserved.
//

#import "UIControl+RKSwizzle.h"
#import "RKSwizzleTool.h"
#import "RKLogDataCenter.h"
#import "RKLogUploader.h"
#import "RKLogContainer.h"

@implementation UIControl (RKSwizzle)

+ (void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        SEL originSEL = @selector(sendAction:to:forEvent:);
        SEL swizzleSEL = @selector(swizzleSendAction:to:forEvent:);
        [RKSwizzleTool RKSwizzleWithClass:[self class] originSelector:originSEL swizzleSelector:swizzleSEL];
    });
    
}

/**
 点击button本身会触发uicontrol的下边的方法，category优先级更高
 此处拦截的话，UIApplication将不会调用sendAction:to:fromSender:forEvent:发送到ViewContoller当中,如果想到继续调用原方法，加上[[UIApplication sharedApplication] sendAction:action to:target from:self forEvent:event];
 */
//- (void)sendAction:(SEL)action to:(nullable id)target forEvent:(nullable UIEvent *)event {
//    
//    NSLog(@"sendAction");
//    
//}

- (void)swizzleSendAction:(SEL)action to:(nullable id)target forEvent:(nullable UIEvent *)event {

   NSString *pathString = [[NSBundle mainBundle] pathForResource:@"DownLoadSource" ofType:@"plist"];
   NSDictionary *plistDic = [NSDictionary dictionaryWithContentsOfFile:pathString];
    
    //初始化埋点数据中心
    RKLogDataCenter *dataCenter = ({
        RKLogDataCenter *dataCenter = [RKLogDataCenter new];
        dataCenter;
    });
    
    //初始化要上报的日志
    NSMutableDictionary *logDic = [[NSMutableDictionary alloc]init];
    
    //获取类的方法列表
    NSDictionary *classMethodDic = plistDic[NSStringFromClass([target class])];

    //获取方法中参数
    NSArray *parameterArray = classMethodDic[NSStringFromSelector(action)];
    
    for (int i = 0; i < parameterArray.count; i++) {
        NSString *parameterString = parameterArray[i];
#pragma clang diagnostic push
#pragma clang diagnostic ignored"-Warc-performSelector-leaks"
        /**
         各种警告类型
         http://fuckingclangwarnings.com/
         */
        //由于parameterSting这个方法运行时加载，程序不知道它的返回值是什么类型，容易造成内存泄漏，还是标记为ns_returns_retained还是ns_returns_autoreleased?
       NSString *valueString = [dataCenter performSelector:NSSelectorFromString(parameterString) withObject:nil];
#pragma clang diagnostic pop
        //不可变字典会crash
        [logDic setValue:valueString forKey:parameterString];
    }
    
    if ([logDic allKeys].count) {
        [[RKLogContainer shareInstance] addLog:logDic];
    }
}

@end
