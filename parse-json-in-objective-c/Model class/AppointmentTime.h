//
//  ChatBotAppointment.h
//  TestProject2
//
//  Created by REVE Systems on 2/6/23.
//

#import<Foundation/Foundation.h>

@interface AppointmentTime : NSObject

@property(nonatomic,strong,nullable) NSString* from;
@property(nonatomic,strong,nullable) NSString* to;
@property(nonatomic,strong,nullable) NSString* day;
@property(nonatomic,strong,nullable) NSString* status;

-(nullable instancetype) initWithDictionary:(nullable NSDictionary*) dict;

@end
