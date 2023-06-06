//
//  ChatBotAppointment.m
//  TestProject2
//
//  Created by REVE Systems on 2/6/23.
//

#import <Foundation/Foundation.h>
#import "AppointmentTime.h"

@implementation AppointmentTime

- (nullable instancetype)initWithDictionary:(nullable NSDictionary *)dict {
    if (self = [super init]) {
        self.from = dict[@"from"];
        self.to = dict[@"to"];
        self.day = dict[@"day"];
        self.status = dict[@"status"];
    }
    return self;
}

@end
