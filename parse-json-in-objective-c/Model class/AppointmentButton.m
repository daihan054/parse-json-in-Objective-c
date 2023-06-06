//
//  AppointmentButton.m
//  TestProject2
//
//  Created by REVE Systems on 4/6/23.
//

#import <Foundation/Foundation.h>
#import "AppointmentButton.h"
#import "AppointmentPayload.h"

@implementation AppointmentButton

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    if (self = [super init]) {
        self.payload = dict[@"payload"];
        self.title = dict[@"title"];
        self.type = dict[@"type"];
    }
    return self;
}

- (void)setPayload:(NSDictionary *)payload {
    _payload = [[AppointmentPayload alloc]initWithDictionary:payload];
}

@end
