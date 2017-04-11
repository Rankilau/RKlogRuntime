//
//  RKLogContainer.m
//  RKlogRuntime
//
//  Created by rankilau on 2017/4/11.
//  Copyright © 2017年 rankilau. All rights reserved.
//

#import "RKLogContainer.h"
#import "RKLogUploader.h"

#define KLogMaxNumber 5
static RKLogContainer *logContainer;

@interface RKLogContainer ()

@property (nonatomic, strong) NSMutableArray *logArray;

@end

@implementation RKLogContainer

+ (instancetype)shareInstance {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        logContainer = [[super allocWithZone:NULL] init];
    });
    return logContainer;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
   return [RKLogContainer shareInstance];
}

+ (id)copyWithZone:(struct _NSZone *)zone {
    return [RKLogContainer shareInstance];
}

+ (id)mutableCopyWithZone:(struct _NSZone *)zone {
    return [RKLogContainer shareInstance];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.logArray = [NSMutableArray arrayWithCapacity:5];
    }
    return self;
}

- (void)addLog:(NSDictionary *)logDictionary {
    [self.logArray addObject:logDictionary];
    if (self.logArray.count == KLogMaxNumber) {
        [[RKLogUploader shareInstance] uploadLog:self.logArray];
        [self.logArray removeAllObjects];
    }
}

@end
