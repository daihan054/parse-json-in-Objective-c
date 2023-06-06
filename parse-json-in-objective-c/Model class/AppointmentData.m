//
//  AppointmentData.m
//  TestProject2
//
//  Created by REVE Systems on 4/6/23.
//

#import <Foundation/Foundation.h>
#import "AppointmentData.h"
#import "AppointmentMessageDetails.h"

@implementation AppointmentData

- (nullable instancetype)initWithDictionary:(nullable NSDictionary *)dict {
    if (self = [super init]) {
        self.botName = dict[@"botName"];
        self.from = dict[@"from"];
        self.botid = dict[@"botid"];
        self.to = dict[@"to"];
        self.type = [dict[@"type"] intValue];
        self.account = dict[@"account"];
        self.messaging = dict[@"messaging"];
    }
    return self;
}

- (void)setMessaging:(nullable NSDictionary *)messaging {
    _messaging = [[AppointmentMessageDetails alloc]initWithDictionary:messaging];
}

@end
