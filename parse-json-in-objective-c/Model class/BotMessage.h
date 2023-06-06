//
//  BotMessage.h
//  TestProject2
//
//  Created by REVE Systems on 29/5/23.
//
#import<Foundation/Foundation.h>

@interface BotMessage : NSObject
@property (nonatomic, strong,nullable) NSString *botName;
@property (nonatomic, strong,nullable) NSString *from;
@property (nonatomic, strong,nullable) NSString *botid;
@property (nonatomic, strong,nullable) NSString *to;
@property (nonatomic, assign) NSInteger type;
@property (nonatomic, strong,nullable) NSString *account;

@end
