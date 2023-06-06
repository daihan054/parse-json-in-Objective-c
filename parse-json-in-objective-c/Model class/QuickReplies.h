//
//  QuickReplies.h
//  TestProject2
//
//  Created by REVE Systems on 1/6/23.
//

#import<Foundation/Foundation.h>

@interface QuickReplies : NSObject

@property(nonatomic,strong,nullable) NSString* contentType; 
@property(nonatomic,strong,nullable) NSString* payload; 
@property(nonatomic,strong,nullable) NSString* title; 

-(nullable instancetype) initWithDictionary:(nullable NSDictionary*) dict;

@end
