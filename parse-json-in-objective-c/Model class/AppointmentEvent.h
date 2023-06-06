//
//  AppointmentEvent.h
//  TestProject2
//
//  Created by REVE Systems on 4/6/23.
//

#import<Foundation/Foundation.h>
#import "AppointmentAttendee.h"

@interface AppointmentEvent : NSObject

@property(nonatomic,strong,nullable) NSString* summary; 
@property(nonatomic,strong,nullable) NSMutableArray<AppointmentAttendee*>* attendees; 
@property(nonatomic,strong,nullable) NSString* slotNotAvailableMsg; 
@property(nonatomic,strong,nullable) NSString* eventDescription; 
@property(nonatomic,assign) int64_t startTime;
@property(nonatomic,assign) int64_t endTime; 
@property(nonatomic,strong,nullable) NSString* title; 
@property(nonatomic,strong,nullable) NSString* successMessage; 
@property(nonatomic,strong,nullable) NSString* meetingTimezone; 

-(nullable instancetype) initWithDictionary:(nullable NSDictionary*)dict;

@end
