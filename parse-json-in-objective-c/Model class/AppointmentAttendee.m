//
//  AppointmentAttendee.m
//  TestProject2
//
//  Created by REVE Systems on 4/6/23.
//

#import <Foundation/Foundation.h>
#import "AppointmentAttendee.h"

@implementation AppointmentAttendee

- (nullable instancetype)initWithDictionary:(nullable NSDictionary *)dict {
    if (self = [super init]) {
        self.name = dict[@"name"];
        self.email = dict[@"email"];
    }
    return self;
}

@end
