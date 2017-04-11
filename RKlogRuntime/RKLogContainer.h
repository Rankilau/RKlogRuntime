//
//  RKLogContainer.h
//  RKlogRuntime
//
//  Created by rankilau on 2017/4/11.
//  Copyright © 2017年 rankilau. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RKLogContainer : NSObject

+ (instancetype)shareInstance;

- (void)addLog:(NSDictionary *)logDictionary;

@end
