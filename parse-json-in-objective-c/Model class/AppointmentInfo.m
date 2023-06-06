//
//  AppointmentInfo.m
//  TestProject2
//
//  Created by REVE Systems on 4/6/23.
//

#import <Foundation/Foundation.h>
#import "AppointmentInfo.h"
#import "AppointmentAttachment.h"
#import "AppointmentTime.h"

@implementation AppointmentInfo

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    if (self = [super init]) {
        self.meetingTitle = dict[@"meeting_title"];
        self.availableDateTime = dict[@"available_datetime"];
        self.meetingDescription = dict[@"meeting_description"];
        self.slotNotAvailableMsg = dict[@"slot_not_available_msg"];
        self.meetingTimezone = dict[@"meeting_timezone"];
        self.attachment = dict[@"attachment"];
        self.googleLogin = [dict[@"google_login"] boolValue];
        self.successMsg = dict[@"success_msg"];
        self.headingText = dict[@"heading_text"];
        self.meetingDuration = dict[@"meeting_duration"];
    }
    return self;
}

- (void)setAttachment:(NSDictionary *)attachment {
    _attachment = [[AppointmentAttachment alloc]initWithDictionary:attachment];
}

- (void)setAvailableDateTime:(nullable NSArray *)availableDateTime {
    _availableDateTime = [NSMutableArray array];
    
    for (NSDictionary* dict in availableDateTime) {
        AppointmentTime* time = [[AppointmentTime alloc]initWithDictionary:dict];
        [_availableDateTime addObject:time];
    }
}

@end
