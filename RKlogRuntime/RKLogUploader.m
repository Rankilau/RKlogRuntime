//
//  RKLogUploader.m
//  RKlogRuntime
//
//  Created by rankilau on 2017/4/3.
//  Copyright © 2017年 rankilau. All rights reserved.
//

#import "RKLogUploader.h"

static RKLogUploader *logUploader;

@implementation RKLogUploader

+ (instancetype)shareInstance {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        logUploader = [[super allocWithZone:NULL] init];
    });
    return logUploader;
    
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    return [RKLogUploader shareInstance];
}

+ (id)copyWithZone:(struct _NSZone *)zone {
    return [RKLogUploader shareInstance];
}

+ (id)mutableCopyWithZone:(struct _NSZone *)zone {
    return [RKLogUploader shareInstance];
}

- (void)uploadLog:(NSMutableArray *)logArray {
    NSLog(@"需要上传的log：%@",logArray);
}

@end
