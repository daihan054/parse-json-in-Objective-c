//
//  ChatBotPayload.h
//  TestProject2
//
//  Created by REVE Systems on 29/5/23.
//

#import <Foundation/Foundation.h>
#import "CarouselElement.h"
#import "ChatBotButton.h"

@interface AttachmentPayload : NSObject

@property(nonatomic,strong,nullable) NSString* templateType;
@property(nonatomic,strong,nullable) NSString* text;
@property(nonatomic,strong,nullable) NSString* url;
@property(nonatomic,strong,nullable) NSMutableArray<CarouselElement*>* elements;
@property(nonatomic,strong,nullable) NSMutableArray<ChatBotButton*>* buttons;

-(nullable instancetype) initWithDictionary:(nullable NSDictionary*) dict;

@end
