//
//  ChatBotButton.h
//  TestProject2
//
//  Created by REVE Systems on 29/5/23.
//



#import <Foundation/Foundation.h>

@interface ChatBotButton : NSObject

@property(nonatomic,strong,nullable) NSString* payload;
@property(nonatomic,strong,nullable) NSString* title;
@property(nonatomic,strong,nullable) NSString* type;
@property(nonatomic,strong,nullable) NSString* url;

-(nullable instancetype) initWithDictionary:(nullable NSDictionary*) dict;

@end
