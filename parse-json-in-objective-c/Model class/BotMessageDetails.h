//
//  BotMessageDetails.h
//  TestProject2
//
//  Created by REVE Systems on 29/5/23.
//

#import<Foundation/Foundation.h>
#import "BotMessageInfo.h"


@interface BotMessageDetails : NSObject

@property(nonatomic,strong,nullable) NSString* messageId; 
@property(nonatomic,strong,nullable) NSMutableArray<BotMessageInfo*>* message; 
@property(nonatomic,assign) int64_t lastRecievedMsgTimeStamp; 
@property(nonatomic,strong,nullable) NSString* deliveryStatus; 
@property(nonatomic,assign) int64_t timestamp; 
@property(nonatomic,strong,nullable) NSString* sentBy; 

-(nullable instancetype) initWithDictionary:(nullable NSDictionary*) dict;

@end
