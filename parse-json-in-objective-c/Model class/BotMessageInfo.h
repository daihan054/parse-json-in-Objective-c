//
//  BotMessageInfo.h
//  TestProject2
//
//  Created by REVE Systems on 29/5/23.
//

#import <Foundation/Foundation.h>
#import "MediaAttach.h"

@interface BotMessageInfo : NSObject

@property (nonatomic, assign) NSInteger sendingDelayMillis; 
@property (nonatomic, strong,nullable) NSString* type; 
@property (nonatomic, strong,nullable) MediaAttach* message; 
@property (nonatomic, strong,nullable) NSString* status; 

-(nullable instancetype) initWithDictionary:(nullable NSDictionary*) dict;

@end
