//
//  AppointmentMessage.h
//  TestProject2
//
//  Created by REVE Systems on 4/6/23.
//

#import<Foundation/Foundation.h>
#import "AppointmentInfo.h"

@interface AppointmentMessage : NSObject

@property(nonatomic,strong,nullable) NSString* type;
@property(nonatomic,strong,nullable) AppointmentInfo* message;

-(nullable instancetype) initWithDictionary:(nullable NSDictionary*) dict;

@end
