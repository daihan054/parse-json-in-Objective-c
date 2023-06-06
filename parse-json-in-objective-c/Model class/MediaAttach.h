//
//  MediaAttach.h
//  TestProject2
//
//  Created by REVE Systems on 29/5/23.
//

#import <Foundation/Foundation.h>
#import "Attachment.h"
#import "AppointmentEvent.h"
#import "QuickReplies.h"

@interface MediaAttach : NSObject

@property(nonatomic,strong,nullable) AppointmentEvent* addEvent;
@property(nonatomic,strong,nullable) NSString* numberOfRepeat;
@property(nonatomic,assign) NSInteger failedNode;
@property(nonatomic,strong,nullable) NSString* transferMsg;
@property(nonatomic,strong,nullable) NSMutableArray<QuickReplies*>* quickReplies;
@property(nonatomic,strong,nullable) NSString* validationType;
@property(nonatomic,strong,nullable) NSString* attributeName;
@property(nonatomic,strong,nullable) NSString* text;
@property(nonatomic,strong,nullable) NSString* failureMessage;
@property(nonatomic,strong,nullable) Attachment* attachment;

-(nullable instancetype) initWithDictionary:(nullable NSDictionary*) dict;

@end
