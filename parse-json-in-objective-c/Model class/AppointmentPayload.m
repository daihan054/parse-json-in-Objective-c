//
//  AppointmentPayload.m
//  TestProject2
//
//  Created by REVE Systems on 4/6/23.
//

#import <Foundation/Foundation.h>
#import "AppointmentPayload.h"

@implementation AppointmentPayload

- (nullable instancetype)initWithDictionary:(nullable NSDictionary *)dict {
    if (self = [super init]) {
        self.type = dict[@"type"];
        self.value = dict[@"value"];
    }
    return self;
}

@end
