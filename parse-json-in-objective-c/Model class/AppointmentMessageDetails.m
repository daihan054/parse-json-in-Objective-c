//
//  AppointmentMessageDetails.m
//  TestProject2
//
//  Created by REVE Systems on 4/6/23.
//

#import <Foundation/Foundation.h>
#import "AppointmentMessageDetails.h"
#import "AppointmentInfo.h"

@implementation AppointmentMessageDetails

- (nullable instancetype)initWithDictionary:(nullable NSDictionary *)dict {
    if (self = [super init]) {
        self.messageId = dict[@"messageId"];
        self.message = dict[@"message"];
        self.lastReceivedMsgTimeStamp = [dict[@"lastReceivedMsgTimeStamp"] longLongValue];
        self.deliveryStatus = dict[@"deliveryStatus"];
        self.timestamp = [dict[@"timestamp"] longLongValue];
        self.sentBy = dict[@"sentBy"];
    }
    return self;
}

- (void)setMessage:(nullable NSArray *)message {    
    _message = [NSMutableArray array];
    
    for (NSDictionary* dict in message) {
        AppointmentMessage* info = [[AppointmentMessage alloc]initWithDictionary:dict];
        [_message addObject:info];
    }
}

@end
