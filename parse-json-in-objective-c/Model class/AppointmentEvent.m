//
//  AppointmentEvent.m
//  TestProject2
//
//  Created by REVE Systems on 4/6/23.
//

#import <Foundation/Foundation.h>
#import "AppointmentEvent.h"
#import "AppointmentAttendee.h"

@implementation AppointmentEvent

- (nullable instancetype)initWithDictionary:(nullable NSDictionary *)dict {
    if (self = [super init]) {
        self.summary = dict[@"summary"];
        self.attendees = dict[@"attendees"];
        self.slotNotAvailableMsg = dict[@"slotNotAvailableMsg"];
        self.eventDescription = dict[@"description"];
        self.startTime = [dict[@"startTime"] longLongValue];
        self.endTime = [dict[@"endTime"] longLongValue];
        self.title = dict[@"title"];
        self.successMessage = dict[@"successMessage"];
        self.meetingTimezone = dict[@"meetingTimezone"];
    }
    return self;
}

- (void)setAttendees:(nullable NSArray *)attendees {
    _attendees = [NSMutableArray array];
    
    for (NSDictionary* dict in attendees) {
        AppointmentAttendee* attendee = [[AppointmentAttendee alloc]initWithDictionary:dict];
        [_attendees addObject:attendee];
    }
}

@end
