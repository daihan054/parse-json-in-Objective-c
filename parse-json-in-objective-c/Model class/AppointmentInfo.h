//
//  AppointmentInfo.h
//  TestProject2
//
//  Created by REVE Systems on 4/6/23.
//

#import<Foundation/Foundation.h>
#import "AppointmentTime.h"
#import "AppointmentAttachment.h"

@interface AppointmentInfo : NSObject

@property(nonatomic,strong,nullable) NSString* meetingTitle;
@property(nonatomic,strong,nullable) NSMutableArray<AppointmentTime*>* availableDateTime;
@property(nonatomic,strong,nullable) NSString* meetingDescription;
@property(nonatomic,strong,nullable) NSString* slotNotAvailableMsg;
@property(nonatomic,strong,nullable) NSString* meetingTimezone;
@property(nonatomic,strong,nullable) AppointmentAttachment* attachment;
@property(nonatomic,assign) BOOL googleLogin;
@property(nonatomic,strong,nullable) NSString* successMsg;
@property(nonatomic,strong,nullable) NSString* headingText;
@property(nonatomic,strong,nullable) NSString* meetingDuration;

-(nullable instancetype) initWithDictionary:(nullable NSDictionary*)dict;

@end
