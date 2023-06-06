//
//  ChatBotResponse.h
//  TestProject2
//
//  Created by REVE Systems on 29/5/23.
//

#import<Foundation/Foundation.h>
#import "BotMessageDetails.h"
#import "BotMessage.h"


@interface ChatBotResponse : BotMessage

@property(nonatomic,strong,nullable) BotMessageDetails* messaging;

-(nullable instancetype) initWithDictionary:(nullable NSDictionary*) dict;

@end

