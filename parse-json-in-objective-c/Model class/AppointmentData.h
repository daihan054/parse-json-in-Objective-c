//
//  AppointmentData.h
//  TestProject2
//
//  Created by REVE Systems on 4/6/23.
//

#import<Foundation/Foundation.h>
#import "AppointmentMessageDetails.h"

@interface AppointmentData : NSObject

@property(nonatomic,strong,nullable) NSString* botName;
@property(nonatomic,strong,nullable) NSString* from;
@property(nonatomic,strong,nullable) NSString* botid;
@property(nonatomic,strong,nullable) NSString* to;
@property(nonatomic,assign) NSInteger type;
@property(nonatomic,strong,nullable) NSString* account;
@property(nonatomic,strong,nullable) AppointmentMessageDetails* messaging;

-(nullable instancetype) initWithDictionary:(nullable NSDictionary*) dict;

@end
