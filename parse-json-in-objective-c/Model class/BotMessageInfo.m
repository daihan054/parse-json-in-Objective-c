//
//  BotMessageInfo.m
//  TestProject2
//
//  Created by REVE Systems on 29/5/23.
//

#import <Foundation/Foundation.h>
#import "BotMessageInfo.h"

@implementation BotMessageInfo

- (nullable instancetype)initWithDictionary:(nullable NSDictionary *)dict {
    self = [super init];
    if (self) {
        self.sendingDelayMillis = [dict[@"sendingDelayMillis"] integerValue];
        self.type = dict[@"type"];
        self.message = dict[@"message"];
        self.status = dict[@"status"];
    }
    return self;
}

- (void)setMessage:(nullable NSDictionary *)message {
    _message = [[MediaAttach alloc]initWithDictionary:message];
}

@end
