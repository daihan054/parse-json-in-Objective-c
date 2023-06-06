//
//  AppointmentMessage.m
//  TestProject2
//
//  Created by REVE Systems on 4/6/23.
//

#import <Foundation/Foundation.h>
#import "AppointmentMessage.h"
#import "AppointmentInfo.h"

@implementation AppointmentMessage

- (nullable instancetype)initWithDictionary:(nullable NSDictionary *)dict {
    if (self = [super init]) {
        self.type = dict[@"type"];
        self.message = dict[@"message"];
    }
    return self;
}

- (void)setMessage:(NSDictionary *)message {
    _message = [[AppointmentInfo alloc]initWithDictionary:message];
}

@end
