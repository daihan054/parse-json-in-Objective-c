//
//  BotMessageAttachment.h
//  TestProject2
//
//  Created by REVE Systems on 29/5/23.
//

#import<Foundation/Foundation.h>
#import "AttachmentPayload.h"

@interface Attachment : NSObject

@property(nonatomic,strong,nullable) AttachmentPayload* payload;
@property(nonatomic,strong,nullable) NSString* type;

-(nullable instancetype) initWithDictionary:(nullable NSDictionary*) dict;

@end
