//
//  AppointmentButton.h
//  TestProject2
//
//  Created by REVE Systems on 4/6/23.
//

#import <Foundation/Foundation.h>
#import "AppointmentPayload.h"

@interface AppointmentButton: NSObject

@property(nonatomic,strong,nullable) AppointmentPayload* payload;
@property(nonatomic,strong,nullable) NSString* title;
@property(nonatomic,strong,nullable) NSString* type;

-(nullable instancetype) initWithDictionary:(nullable NSDictionary*) dict;

@end
