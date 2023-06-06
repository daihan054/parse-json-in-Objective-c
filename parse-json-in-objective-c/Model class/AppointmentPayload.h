//
//  AppointmentPayload.h
//  TestProject2
//
//  Created by REVE Systems on 4/6/23.
//

#import<Foundation/Foundation.h>

@interface AppointmentPayload : NSObject

@property(nonatomic,strong,nullable) NSString* type;
@property(nonatomic,strong,nullable) NSString* value;

-(nullable instancetype) initWithDictionary:(nullable NSDictionary*) dict;

@end
