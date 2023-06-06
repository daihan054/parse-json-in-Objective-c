//
//  AppointmentAttendee.h
//  TestProject2
//
//  Created by REVE Systems on 4/6/23.
//

#import<Foundation/Foundation.h>

@interface AppointmentAttendee : NSObject

@property(nonatomic,strong,nullable) NSString* name; 
@property(nonatomic,strong,nullable) NSString* email; 

-(nullable instancetype) initWithDictionary:(nullable NSDictionary*)dict;

@end
