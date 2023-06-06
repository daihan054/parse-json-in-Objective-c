//
//  AppointmentAttachment.m
//  TestProject2
//
//  Created by REVE Systems on 4/6/23.
//

#import <Foundation/Foundation.h>
#import "AppointmentAttachment.h"
#import "AppointmentAttachmentPayload.h"

@implementation AppointmentAttachment

- (nullable instancetype)initWithDictionary:(nullable NSDictionary *)dict {
    if (self = [super init]) {
        self.payload = dict[@"payload"];
        self.type = dict[@"type"];
    }
    return self;
}

- (void)setPayload:(NSDictionary *)payload {
    _payload = [[AppointmentAttachmentPayload alloc]initWithDictionary:payload];
}

@end
