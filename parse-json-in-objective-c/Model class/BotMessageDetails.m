//
//  BotMessageDetails.m
//  TestProject2
//
//  Created by REVE Systems on 29/5/23.
//

#import <Foundation/Foundation.h>
#import "BotMessageDetails.h"

@implementation BotMessageDetails

- (nullable instancetype)initWithDictionary:(nullable NSDictionary *)dict {
    if (self = [super init]) {
        self.messageId = dict[@"messageId"];
        self.message = dict[@"message"];
        self.lastRecievedMsgTimeStamp = [dict[@"lastRecievedMsgTimeStamp"] longLongValue];
        self.deliveryStatus = dict[@"deliveryStatus"];
        self.timestamp = [dict[@"timestamp"] longLongValue];
        self.sentBy = dict[@"sentBy"];
    }
    return self;
}

- (void)setMessage:(nullable NSArray *)message {
    _message = [NSMutableArray array];
    for (NSDictionary *messageDict in message) {
        BotMessageInfo *messageInfo = [[BotMessageInfo alloc] initWithDictionary:messageDict];
        [_message addObject:messageInfo];
    }
}

@end
