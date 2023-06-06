//
//  AppointmentAttachmentPayload.h
//  TestProject2
//
//  Created by REVE Systems on 4/6/23.
//

#import<Foundation/Foundation.h>
#import "AppointmentButton.h"

@interface AppointmentAttachmentPayload : NSObject

@property(nonatomic,strong,nullable) NSMutableArray<AppointmentButton*>* buttons;
@property(nonatomic,strong,nullable) NSString* templateType;
@property(nonatomic,strong,nullable) NSString* text;

-(nullable instancetype) initWithDictionary:(nullable NSDictionary*)dict;

@end
