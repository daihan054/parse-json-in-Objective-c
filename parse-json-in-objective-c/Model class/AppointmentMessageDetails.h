//
//  AppointmentMessageDetails.h
//  TestProject2
//
//  Created by REVE Systems on 4/6/23.
//

#import<Foundation/Foundation.h>
#import "AppointmentMessage.h"

@interface AppointmentMessageDetails : NSObject

@property(nonatomic,strong,nullable) NSString* messageId;
@property(nonatomic,strong,nullable) NSMutableArray<AppointmentMessage*>* message;
@property(nonatomic,assign) int64_t lastReceivedMsgTimeStamp;
@property(nonatomic,strong,nullable) NSString* deliveryStatus;
@property(nonatomic,assign) int64_t timestamp;
@property(nonatomic,strong,nullable) NSString* sentBy;

-(nullable instancetype) initWithDictionary:(nullable NSDictionary*)dict;

@end
