//
//  ChatBotResponse.m
//  TestProject2
//
//  Created by REVE Systems on 29/5/23.
//

#import <Foundation/Foundation.h>
#import "ChatBotResponse.h"

@implementation ChatBotResponse

- (nullable instancetype)initWithDictionary:(nullable NSDictionary *)dict {
    if (self = [super init]) {
        self.botName = dict[@"botName"];
        self.from = dict[@"from"];
        self.botid = dict[@"botid"];
        self.to = dict[@"to"];
        self.type = [dict[@"type"] integerValue];
        self.account = dict[@"account"];
        self.messaging = dict[@"messaging"];
    }
    return self;
}

- (void)setMessaging:(nullable NSDictionary *)messaging {
    _messaging = [[BotMessageDetails alloc]initWithDictionary:messaging];
}

@end
