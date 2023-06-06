//
//  AppointmentAttachmentPayload.h
//  TestProject2
//
//  Created by REVE Systems on 4/6/23.
//

#import<Foundation/Foundation.h>
#import "AppointmentButton.h"
#import "AppointmentAttachmentPayload.h"

@interface AppointmentAttachment : NSObject

@property(nonatomic,strong,nullable) AppointmentAttachmentPayload* payload;
@property(nonatomic,strong,nullable) NSString* type;

-(nullable instancetype) initWithDictionary:(nullable NSDictionary*)dict;

@end
