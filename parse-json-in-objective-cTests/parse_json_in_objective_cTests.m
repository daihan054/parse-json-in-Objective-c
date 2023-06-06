//
//  parse_json_in_objective_cTests.m
//  parse-json-in-objective-cTests
//
//  Created by REVE Systems on 6/6/23.
//

#import <XCTest/XCTest.h>
#import "ChatBotResponse.h"
#import "AppointmentData.h"

@interface parse_json_in_objective_cTests : XCTestCase

@end

@implementation parse_json_in_objective_cTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testParsingJSON_001 {
    // Given
    NSDictionary *jsonResponse = @{
        @"botName": @"Test_may_2023",
        @"from": @"0001685465334135-f23c928effffae20-0001",
        @"botid": @"1c2a4387-e8e6-4414-b383-ab7c6f2c1581",
        @"to": @"0001685465334135-f23c928effffae20-0001",
        @"type": @4096,
        @"account": @"8511385",
        @"messaging": @{
            @"messageId": @"3d972f76-bba3-476e-b3d4-13e5f7bc6e2c",
            @"message": @[
                @{
                    @"sendingDelayMillis": @2000,
                    @"type": @"text",
                    @"message": @{
                        @"text": @"I am ReveBot_d, your virtual assistant. How can I help you?"
                    }
                }
            ],
            @"lastRecievedMsgTimeStamp": @0,
            @"deliveryStatus": @"delivered",
            @"timestamp": @1685465503001,
            @"sentBy": @"Agent"
        }
    };
    
    // When
    ChatBotResponse *response = [[ChatBotResponse alloc] initWithDictionary:jsonResponse];
    
    // Then
    XCTAssertNotNil(response);
    XCTAssertEqualObjects(response.botName, @"Test_may_2023");
    XCTAssertEqualObjects(response.from, @"0001685465334135-f23c928effffae20-0001");
    XCTAssertEqualObjects(response.botid, @"1c2a4387-e8e6-4414-b383-ab7c6f2c1581");
    XCTAssertEqualObjects(response.to, @"0001685465334135-f23c928effffae20-0001");
    XCTAssertEqual(response.type, 4096);
    XCTAssertEqualObjects(response.account, @"8511385");
    
    XCTAssertNotNil(response.messaging);
    XCTAssertEqualObjects(response.messaging.messageId, @"3d972f76-bba3-476e-b3d4-13e5f7bc6e2c");
    XCTAssertEqual(response.messaging.lastRecievedMsgTimeStamp, 0);
    XCTAssertEqualObjects(response.messaging.deliveryStatus, @"delivered");
    XCTAssertEqual(response.messaging.timestamp, 1685465503001);
    XCTAssertEqualObjects(response.messaging.sentBy, @"Agent");
    
    XCTAssertNotNil(response.messaging.message);
    XCTAssertEqual(response.messaging.message.count, 1);
    
    BotMessageInfo *messageInfo = response.messaging.message[0];
    XCTAssertEqual(messageInfo.sendingDelayMillis, 2000);
    XCTAssertEqualObjects(messageInfo.type, @"text");
    
    XCTAssertNotNil(messageInfo.message);
    XCTAssertEqualObjects(messageInfo.message.text, @"I am ReveBot_d, your virtual assistant. How can I help you?");
}

-(void) testParsingJSON_002 {
    NSDictionary *jsonResponse = @{
        @"botName": @"Test_may_2023",
        @"from": @"0001685465334135-f23c928effffae20-0001",
        @"botid": @"1c2a4387-e8e6-4414-b383-ab7c6f2c1581",
        @"to": @"0001685465334135-f23c928effffae20-0001",
        @"type": @(4096),
        @"account": @"8511385",
        @"messaging": @{
            @"messageId": @"860e3c0f-3e0b-4034-8b6a-4802bc0a1792",
            @"message": @[
                @{
                    @"sendingDelayMillis": @(2000),
                    @"type": @"question",
                    @"message": @{
                        @"numberOfRepeat": @"1",
                        @"validationType": @"name",
                        @"attributeName": @"{{name}}",
                        @"text": @"How can I address you?",
                        @"failureMessage": @"You entered wrong format. Please try again"
                    }
                }
            ],
            @"lastRecievedMsgTimeStamp": @(0),
            @"deliveryStatus": @"delivered",
            @"timestamp": @(1685465503002),
            @"sentBy": @"Agent"
        }
    };
    
    ChatBotResponse *response = [[ChatBotResponse alloc]initWithDictionary:jsonResponse];
    XCTAssertNotNil(response);
    XCTAssertEqualObjects(response.botName, @"Test_may_2023");
    XCTAssertEqualObjects(response.from, @"0001685465334135-f23c928effffae20-0001");
    XCTAssertEqualObjects(response.botid, @"1c2a4387-e8e6-4414-b383-ab7c6f2c1581");
    XCTAssertEqualObjects(response.to, @"0001685465334135-f23c928effffae20-0001");
    XCTAssertEqual(response.type, 4096);
    XCTAssertEqualObjects(response.account, @"8511385");
    
    BotMessageDetails* details = response.messaging;
    XCTAssertNotNil(details);
    XCTAssertEqualObjects(details.messageId, @"860e3c0f-3e0b-4034-8b6a-4802bc0a1792");
    XCTAssertEqual(details.lastRecievedMsgTimeStamp, 0);
    XCTAssertEqualObjects(details.deliveryStatus, @"delivered");
    XCTAssertEqual(details.timestamp, 1685465503002);
    XCTAssertEqualObjects(details.sentBy, @"Agent");
    
    NSMutableArray<BotMessageInfo*>* messages = response.messaging.message;
    XCTAssertNotNil(messages);
    XCTAssertEqual(messages.count, 1);
    XCTAssertEqual(messages[0].sendingDelayMillis, 2000);
    XCTAssertEqualObjects(messages[0].type, @"question");
    XCTAssertNotNil(messages[0].message);
    XCTAssertEqualObjects(messages[0].message.numberOfRepeat, @"1");
    XCTAssertEqualObjects(messages[0].message.validationType, @"name");
    XCTAssertEqualObjects(messages[0].message.attributeName, @"{{name}}");
    XCTAssertEqualObjects(messages[0].message.text, @"How can I address you?");
    XCTAssertEqualObjects(messages[0].message.failureMessage, @"You entered wrong format. Please try again");
    
    NSLog(@"quickReplies = %@",messages[0].message.quickReplies);
    NSLog(@"attachment = %@",messages[0].message.attachment);
}

-(void) testParsingJSON_003 {
    NSDictionary *jsonResponse = @{
        @"botName": @"Test_may_2023",
        @"from": @"0001685527594196-f23c928effffae20-0001",
        @"botid": @"1c2a4387-e8e6-4414-b383-ab7c6f2c1581",
        @"to": @"0001685527594196-f23c928effffae20-0001",
        @"type": @4096,
        @"account": @"8511385",
        @"messaging": @{
            @"messageId": @"c0259097-539a-4a06-be02-3084f3f38fc9",
            @"message": @[
                @{
                    @"sendingDelayMillis": @2000,
                    @"type": @"question",
                    @"message": @{
                        @"numberOfRepeat": @"1",
                        @"failedNode": @544512,
                        @"validationType": @"email",
                        @"attributeName": @"{{email}}",
                        @"text": @"What is your email address?",
                        @"failureMessage": @"You entered wrong format. Please try again"
                    }
                }
            ],
            @"lastRecievedMsgTimeStamp": @0,
            @"deliveryStatus": @"delivered",
            @"timestamp": @1685527672838,
            @"sentBy": @"Agent"
        }
    };

    ChatBotResponse* response = [[ChatBotResponse alloc]initWithDictionary:jsonResponse];
    XCTAssertNotNil(response);
    XCTAssertEqualObjects(response.botName, @"Test_may_2023");
    XCTAssertEqualObjects(response.from, @"0001685527594196-f23c928effffae20-0001");
    XCTAssertEqualObjects(response.botid, @"1c2a4387-e8e6-4414-b383-ab7c6f2c1581");
    XCTAssertEqualObjects(response.to, @"0001685527594196-f23c928effffae20-0001");
    XCTAssertEqual(response.type, 4096);
    XCTAssertEqualObjects(response.account, @"8511385");
    
    BotMessageDetails* messaging = response.messaging;
    XCTAssertNotNil(messaging);
    XCTAssertEqualObjects(messaging.messageId, @"c0259097-539a-4a06-be02-3084f3f38fc9");
    XCTAssertEqual(messaging.lastRecievedMsgTimeStamp, 0);
    XCTAssertEqualObjects(messaging.deliveryStatus, @"delivered");
    XCTAssertEqual(messaging.timestamp, 1685527672838);
    XCTAssertEqualObjects(messaging.sentBy, @"Agent");
    
    NSMutableArray<BotMessageInfo*>* messages = response.messaging.message;
    XCTAssertNotNil(messages);
    XCTAssertEqual(messages.count, 1);
    XCTAssertEqual(messages[0].sendingDelayMillis, 2000);
    XCTAssertEqualObjects(messages[0].type, @"question");
    XCTAssertEqualObjects(messages[0].message.numberOfRepeat, @"1");
    XCTAssertEqual(messages[0].message.failedNode, 544512);
    XCTAssertEqualObjects(messages[0].message.validationType, @"email");
    XCTAssertEqualObjects(messages[0].message.attributeName, @"{{email}}");
    XCTAssertEqualObjects(messages[0].message.text, @"What is your email address?");
    XCTAssertEqualObjects(messages[0].message.failureMessage, @"You entered wrong format. Please try again");
    
    XCTAssertEqual(response.messaging.lastRecievedMsgTimeStamp, 0);
    XCTAssertEqualObjects(response.messaging.deliveryStatus, @"delivered");
    XCTAssertEqual(response.messaging.timestamp, 1685527672838);
    XCTAssertEqualObjects(response.messaging.sentBy, @"Agent");
}

- (void)testJSON_004 {

    NSDictionary *jsonResponse = @{
        @"from": @"0001685527594196-f23c928effffae20-0001",
        @"botid": @"1c2a4387-e8e6-4414-b383-ab7c6f2c1581",
        @"to": @"0001685527594196-f23c928effffae20-0001",
        @"type": @4096,
        @"account": @"8511385",
        @"messaging": @{
            @"messageId": @"b1b15aba-7a93-4180-adfe-ae097e4f35d3",
            @"message": @[
                @{
                    @"message": @{
                        @"text": @"You entered wrong format. Please try again"
                    },
                    @"type": @"text"
                }
            ],
            @"lastRecievedMsgTimeStamp": @0,
            @"deliveryStatus": @"delivered",
            @"timestamp": @1685527870718,
            @"sentBy": @"Agent"
        }
    };

    // Parse JSON response
    ChatBotResponse *response = [[ChatBotResponse alloc] initWithDictionary:jsonResponse];

    // Perform assertions
    XCTAssertEqualObjects(response.from, @"0001685527594196-f23c928effffae20-0001");
    XCTAssertEqualObjects(response.botid, @"1c2a4387-e8e6-4414-b383-ab7c6f2c1581");
    XCTAssertEqualObjects(response.to, @"0001685527594196-f23c928effffae20-0001");
    XCTAssertEqual(response.type, 4096);
    XCTAssertEqualObjects(response.account, @"8511385");
    XCTAssertEqualObjects(response.messaging.messageId, @"b1b15aba-7a93-4180-adfe-ae097e4f35d3");
    XCTAssertEqual(response.messaging.lastRecievedMsgTimeStamp, 0);
    XCTAssertEqualObjects(response.messaging.deliveryStatus, @"delivered");
    XCTAssertEqual(response.messaging.timestamp, 1685527870718);
    XCTAssertEqualObjects(response.messaging.sentBy, @"Agent");
    XCTAssertEqual(response.messaging.message.count, 1);
    
    // Verify message content
    BotMessageInfo *messageInfo = response.messaging.message.firstObject;
    XCTAssertEqualObjects(messageInfo.type, @"text");
    XCTAssertEqualObjects(messageInfo.message.text, @"You entered wrong format. Please try again");
}

- (void)testJSON_005 {
    // Mock JSON response
    NSDictionary *jsonResponse = @{
        @"botName": @"Test_may_2023",
        @"from": @"0001685527594196-f23c928effffae20-0001",
        @"botid": @"1c2a4387-e8e6-4414-b383-ab7c6f2c1581",
        @"to": @"0001685527594196-f23c928effffae20-0001",
        @"type": @4096,
        @"account": @"8511385",
        @"messaging": @{
            @"messageId": @"fc443fe1-d190-4be5-92d3-275faf9bc620",
            @"message": @[
                @{
                    @"sendingDelayMillis": @2000,
                    @"type": @"text",
                    @"message": @{
                        @"text": @"Your email is in wrong format"
                    }
                }
            ],
            @"lastRecievedMsgTimeStamp": @0,
            @"deliveryStatus": @"delivered",
            @"timestamp": @1685528166488,
            @"sentBy": @"Agent"
        }
    };

    // Parse JSON response
    ChatBotResponse *response = [[ChatBotResponse alloc] initWithDictionary:jsonResponse];

    // Perform assertions
    XCTAssertEqualObjects(response.botName, @"Test_may_2023");
    XCTAssertEqualObjects(response.from, @"0001685527594196-f23c928effffae20-0001");
    XCTAssertEqualObjects(response.botid, @"1c2a4387-e8e6-4414-b383-ab7c6f2c1581");
    XCTAssertEqualObjects(response.to, @"0001685527594196-f23c928effffae20-0001");
    XCTAssertEqual(response.type, 4096);
    XCTAssertEqualObjects(response.account, @"8511385");
    XCTAssertEqualObjects(response.messaging.messageId, @"fc443fe1-d190-4be5-92d3-275faf9bc620");
    XCTAssertEqual(response.messaging.lastRecievedMsgTimeStamp, 0);
    XCTAssertEqualObjects(response.messaging.deliveryStatus, @"delivered");
    XCTAssertEqual(response.messaging.timestamp, 1685528166488);
    XCTAssertEqualObjects(response.messaging.sentBy, @"Agent");
    XCTAssertEqual(response.messaging.message.count, 1);
    
    // Verify message content
    BotMessageInfo *messageInfo = response.messaging.message.firstObject;
    XCTAssertEqual(messageInfo.sendingDelayMillis, 2000);
    XCTAssertEqualObjects(messageInfo.type, @"text");
    XCTAssertEqualObjects(messageInfo.message.text, @"Your email is in wrong format");
}

- (void)testJSON_006 {
    // Mock JSON response
    NSDictionary *jsonResponse = @{
        @"botName": @"Test_may_2023",
        @"from": @"0001685527594196-f23c928effffae20-0001",
        @"botid": @"1c2a4387-e8e6-4414-b383-ab7c6f2c1581",
        @"to": @"0001685527594196-f23c928effffae20-0001",
        @"type": @4096,
        @"account": @"8511385",
        @"messaging": @{
            @"messageId": @"c0ab5dbd-e006-4cdd-aea4-6f9d926f68e9",
            @"message": @[
                @{
                    @"sendingDelayMillis": @2000,
                    @"type": @"button",
                    @"message": @{
                        @"attachment": @{
                            @"payload": @{
                                @"buttons": @[
                                    @{
                                        @"payload": @"544744",
                                        @"title": @"Go to text",
                                        @"type": @"postback"
                                    },
                                    @{
                                        @"payload": @"544751",
                                        @"title": @"Go to image node",
                                        @"type": @"postback"
                                    },
                                    @{
                                        @"payload": @"544752",
                                        @"title": @"Go to question node",
                                        @"type": @"postback"
                                    }
                                ],
                                @"template_type": @"button",
                                @"text": @"Choose one of many - button 1"
                            },
                            @"type": @"template"
                        }
                    }
                }
            ],
            @"lastRecievedMsgTimeStamp": @0,
            @"deliveryStatus": @"delivered",
            @"timestamp": @1685528166489,
            @"sentBy": @"Agent"
        }
    };
    
    // When
    ChatBotResponse *response = [[ChatBotResponse alloc] initWithDictionary:jsonResponse];
    
    // Then
    XCTAssertNotNil(response);
    XCTAssertEqualObjects(response.botName, @"Test_may_2023");
    XCTAssertEqualObjects(response.from, @"0001685527594196-f23c928effffae20-0001");
    XCTAssertEqualObjects(response.botid, @"1c2a4387-e8e6-4414-b383-ab7c6f2c1581");
    XCTAssertEqualObjects(response.to, @"0001685527594196-f23c928effffae20-0001");
    XCTAssertEqual(response.type, 4096);
    XCTAssertEqualObjects(response.account, @"8511385");
    
    XCTAssertNotNil(response.messaging);
    XCTAssertEqualObjects(response.messaging.messageId, @"c0ab5dbd-e006-4cdd-aea4-6f9d926f68e9");
    XCTAssertEqual(response.messaging.lastRecievedMsgTimeStamp, 0);
    XCTAssertEqualObjects(response.messaging.deliveryStatus, @"delivered");
    XCTAssertEqual(response.messaging.timestamp, 1685528166489);
    XCTAssertEqualObjects(response.messaging.sentBy, @"Agent");
    
    XCTAssertNotNil(response.messaging.message);
    XCTAssertEqual(response.messaging.message.count, 1);
    
    BotMessageInfo *messageInfo = response.messaging.message[0];
    XCTAssertEqual(messageInfo.sendingDelayMillis, 2000);
    XCTAssertEqualObjects(messageInfo.type, @"button");
    
    XCTAssertNotNil(messageInfo.message);
    XCTAssertNotNil(messageInfo.message.attachment);
    
    XCTAssertEqualObjects(messageInfo.message.attachment.type, @"template");
    
    XCTAssertNotNil(messageInfo.message.attachment.payload);
    XCTAssertEqualObjects(messageInfo.message.attachment.payload.templateType, @"button");
    XCTAssertEqualObjects(messageInfo.message.attachment.payload.text, @"Choose one of many - button 1");
    
    XCTAssertNotNil(messageInfo.message.attachment.payload.buttons);
    XCTAssertEqual(messageInfo.message.attachment.payload.buttons.count, 3);
    
    ChatBotButton *button1 = messageInfo.message.attachment.payload.buttons[0];
    XCTAssertEqualObjects(button1.payload, @"544744");
    XCTAssertEqualObjects(button1.title, @"Go to text");
    XCTAssertEqualObjects(button1.type, @"postback");
    
    ChatBotButton *button2 = messageInfo.message.attachment.payload.buttons[1];
    XCTAssertEqualObjects(button2.payload, @"544751");
    XCTAssertEqualObjects(button2.title, @"Go to image node");
    XCTAssertEqualObjects(button2.type, @"postback");
    
    ChatBotButton *button3 = messageInfo.message.attachment.payload.buttons[2];
    XCTAssertEqualObjects(button3.payload, @"544752");
    XCTAssertEqualObjects(button3.title, @"Go to question node");
    XCTAssertEqualObjects(button3.type, @"postback");
}

- (void)test_JSON007 {
    // Given
    NSDictionary *jsonDict = @{
        @"botName": @"Test_may_2023",
        @"from": @"0001685527594196-f23c928effffae20-0001",
        @"botid": @"1c2a4387-e8e6-4414-b383-ab7c6f2c1581",
        @"to": @"0001685527594196-f23c928effffae20-0001",
        @"type": @(4096),
        @"account": @"8511385",
        @"messaging": @{
            @"messageId": @"b03cb044-1b74-41a3-a4d5-441ffc35a4f0",
            @"message": @[
                @{
                    @"sendingDelayMillis": @(2000),
                    @"type": @"button",
                    @"message": @{
                        @"attachment": @{
                            @"payload": @{
                                @"buttons": @[
                                    @{
                                        @"payload": @"544753",
                                        @"title": @"Go to quick reply node",
                                        @"type": @"postback"
                                    },
                                    @{
                                        @"payload": @"544754",
                                        @"title": @"Go to carousel node",
                                        @"type": @"postback"
                                    },
                                    @{
                                        @"payload": @"544755",
                                        @"title": @"Go to &quot;Go To node&quot;",
                                        @"type": @"postback"
                                    }
                                ],
                                @"template_type": @"button",
                                @"text": @"Choose one of many - button 2"
                            },
                            @"type": @"template"
                        }
                    }
                }
            ],
            @"lastRecievedMsgTimeStamp": @(0),
            @"deliveryStatus": @"delivered",
            @"timestamp": @(1685528166490),
            @"sentBy": @"Agent"
        }
    };
    
    // When
    ChatBotResponse *response = [[ChatBotResponse alloc] initWithDictionary:jsonDict];
    
    // Then
    XCTAssertNotNil(response);
    XCTAssertEqualObjects(response.botName, @"Test_may_2023");
    XCTAssertEqualObjects(response.from, @"0001685527594196-f23c928effffae20-0001");
    XCTAssertEqualObjects(response.botid, @"1c2a4387-e8e6-4414-b383-ab7c6f2c1581");
    XCTAssertEqualObjects(response.to, @"0001685527594196-f23c928effffae20-0001");
    XCTAssertEqual(response.type, 4096);
    XCTAssertEqualObjects(response.account, @"8511385");
    
    XCTAssertNotNil(response.messaging);
    XCTAssertEqualObjects(response.messaging.messageId, @"b03cb044-1b74-41a3-a4d5-441ffc35a4f0");
    XCTAssertEqual(response.messaging.lastRecievedMsgTimeStamp, 0);
    XCTAssertEqualObjects(response.messaging.deliveryStatus, @"delivered");
    XCTAssertEqual(response.messaging.timestamp, 1685528166490);
    XCTAssertEqualObjects(response.messaging.sentBy, @"Agent");
    
    XCTAssertNotNil(response.messaging.message);
    XCTAssertEqual(response.messaging.message.count, 1);
    
    BotMessageInfo *messageInfo = response.messaging.message[0];
    XCTAssertEqual(messageInfo.sendingDelayMillis, 2000);
    XCTAssertEqualObjects(messageInfo.type, @"button");
    
    XCTAssertNotNil(messageInfo.message);
    XCTAssertNotNil(messageInfo.message.attachment);
    
    XCTAssertEqualObjects(messageInfo.message.attachment.type, @"template");
    
    XCTAssertNotNil(messageInfo.message.attachment.payload);
    XCTAssertEqualObjects(messageInfo.message.attachment.payload.templateType, @"button");
    XCTAssertEqualObjects(messageInfo.message.attachment.payload.text, @"Choose one of many - button 2");
    
    XCTAssertNotNil(messageInfo.message.attachment.payload.buttons);
    XCTAssertEqual(messageInfo.message.attachment.payload.buttons.count, 3);
    
    ChatBotButton *button1 = messageInfo.message.attachment.payload.buttons[0];
    XCTAssertEqualObjects(button1.payload, @"544753");
    XCTAssertEqualObjects(button1.title, @"Go to quick reply node");
    XCTAssertEqualObjects(button1.type, @"postback");
    
    ChatBotButton *button2 = messageInfo.message.attachment.payload.buttons[1];
    XCTAssertEqualObjects(button2.payload, @"544754");
    XCTAssertEqualObjects(button2.title, @"Go to carousel node");
    XCTAssertEqualObjects(button2.type, @"postback");
    
    ChatBotButton *button3 = messageInfo.message.attachment.payload.buttons[2];
    XCTAssertEqualObjects(button3.payload, @"544755");
    XCTAssertEqualObjects(button3.title, @"Go to &quot;Go To node&quot;");
    XCTAssertEqualObjects(button3.type, @"postback");
}

- (void)test_JSON008 {
    // Given
    NSDictionary *jsonDict = @{
        @"botName": @"Test_may_2023",
        @"from": @"0001685527594196-f23c928effffae20-0001",
        @"botid": @"1c2a4387-e8e6-4414-b383-ab7c6f2c1581",
        @"to": @"0001685527594196-f23c928effffae20-0001",
        @"type": @(4096),
        @"account": @"8511385",
        @"messaging": @{
            @"messageId": @"494f499b-0c99-4118-a9a1-4ec30d87477e",
            @"message": @[
                @{
                    @"sendingDelayMillis": @(2000),
                    @"type": @"button",
                    @"message": @{
                        @"attachment": @{
                            @"payload": @{
                                @"buttons": @[
                                    @{
                                        @"payload": @"544756",
                                        @"title": @"Go to audio node",
                                        @"type": @"postback"
                                    },
                                    @{
                                        @"payload": @"544757",
                                        @"title": @"Go to video node",
                                        @"type": @"postback"
                                    },
                                    @{
                                        @"payload": @"544758",
                                        @"title": @"Go to chat transfer node",
                                        @"type": @"postback"
                                    }
                                ],
                                @"template_type": @"button",
                                @"text": @"Choose one of many - button 3"
                            },
                            @"type": @"template"
                        }
                    }
                }
            ],
            @"lastRecievedMsgTimeStamp": @(0),
            @"deliveryStatus": @"delivered",
            @"timestamp": @(1685528166491),
            @"sentBy": @"Agent"
        }
    };
    
    // When
    ChatBotResponse *response = [[ChatBotResponse alloc] initWithDictionary:jsonDict];
    
    // Then
    XCTAssertNotNil(response);
    XCTAssertEqualObjects(response.botName, @"Test_may_2023");
    XCTAssertEqualObjects(response.from, @"0001685527594196-f23c928effffae20-0001");
    XCTAssertEqualObjects(response.botid, @"1c2a4387-e8e6-4414-b383-ab7c6f2c1581");
    XCTAssertEqualObjects(response.to, @"0001685527594196-f23c928effffae20-0001");
    XCTAssertEqual(response.type, 4096);
    XCTAssertEqualObjects(response.account, @"8511385");
    
    XCTAssertNotNil(response.messaging);
    XCTAssertEqualObjects(response.messaging.messageId, @"494f499b-0c99-4118-a9a1-4ec30d87477e");
    XCTAssertEqual(response.messaging.lastRecievedMsgTimeStamp, 0);
    XCTAssertEqualObjects(response.messaging.deliveryStatus, @"delivered");
    XCTAssertEqual(response.messaging.timestamp, 1685528166491);
    XCTAssertEqualObjects(response.messaging.sentBy, @"Agent");
    
    XCTAssertNotNil(response.messaging.message);
    XCTAssertEqual(response.messaging.message.count, 1);
    
    BotMessageInfo *messageInfo = response.messaging.message[0];
    XCTAssertEqual(messageInfo.sendingDelayMillis, 2000);
    XCTAssertEqualObjects(messageInfo.type, @"button");
    
    XCTAssertNotNil(messageInfo.message);
    XCTAssertNotNil(messageInfo.message.attachment);
    XCTAssertEqualObjects(messageInfo.message.attachment.type, @"template");
    
    XCTAssertNotNil(messageInfo.message.attachment.payload);
    XCTAssertEqualObjects(messageInfo.message.attachment.payload.templateType, @"button");
    XCTAssertEqualObjects(messageInfo.message.attachment.payload.text, @"Choose one of many - button 3");
    
    XCTAssertNotNil(messageInfo.message.attachment.payload.buttons);
    XCTAssertEqual(messageInfo.message.attachment.payload.buttons.count, 3);
    
    ChatBotButton *button1 = messageInfo.message.attachment.payload.buttons[0];
    XCTAssertEqualObjects(button1.payload, @"544756");
    XCTAssertEqualObjects(button1.title, @"Go to audio node");
    XCTAssertEqualObjects(button1.type, @"postback");
    
    ChatBotButton *button2 = messageInfo.message.attachment.payload.buttons[1];
    XCTAssertEqualObjects(button2.payload, @"544757");
    XCTAssertEqualObjects(button2.title, @"Go to video node");
    XCTAssertEqualObjects(button2.type, @"postback");
    
    ChatBotButton *button3 = messageInfo.message.attachment.payload.buttons[2];
    XCTAssertEqualObjects(button3.payload, @"544758");
    XCTAssertEqualObjects(button3.title, @"Go to chat transfer node");
    XCTAssertEqualObjects(button3.type, @"postback");
}

- (void)test_JSON009 {
    // Given
    NSDictionary *jsonDict = @{
        @"botName": @"Test_may_2023",
        @"from": @"0001685527594196-f23c928effffae20-0001",
        @"botid": @"1c2a4387-e8e6-4414-b383-ab7c6f2c1581",
        @"to": @"0001685527594196-f23c928effffae20-0001",
        @"type": @(4096),
        @"account": @"8511385",
        @"messaging": @{
            @"messageId": @"c0591285-652b-4a6c-88b0-05b9f56c1fef",
            @"message": @[
                @{
                    @"sendingDelayMillis": @(2000),
                    @"type": @"button",
                    @"message": @{
                        @"attachment": @{
                            @"payload": @{
                                @"buttons": @[
                                    @{
                                        @"payload": @"544760",
                                        @"title": @"Go to email node",
                                        @"type": @"postback"
                                    },
                                    @{
                                        @"title": @"Go to url test",
                                        @"type": @"web_url",
                                        @"url": @"https://stackoverflow.com/questions/48416330/callkit-call-failed-screen-appears?rq=3"
                                    },
                                    @{
                                        @"payload": @"545612",
                                        @"title": @"Go to appointment node",
                                        @"type": @"postback"
                                    }
                                ],
                                @"template_type": @"button",
                                @"text": @"Choose one of many - button 4"
                            },
                            @"type": @"template"
                        }
                    }
                }
            ],
            @"lastRecievedMsgTimeStamp": @(0),
            @"deliveryStatus": @"delivered",
            @"timestamp": @(1685594110472),
            @"sentBy": @"Agent"
        }
    };
    
    // When
    ChatBotResponse *response = [[ChatBotResponse alloc] initWithDictionary:jsonDict];
    
    // Then
    XCTAssertNotNil(response);
    XCTAssertEqualObjects(response.botName, @"Test_may_2023");
    XCTAssertEqualObjects(response.from, @"0001685527594196-f23c928effffae20-0001");
    XCTAssertEqualObjects(response.botid, @"1c2a4387-e8e6-4414-b383-ab7c6f2c1581");
    XCTAssertEqualObjects(response.to, @"0001685527594196-f23c928effffae20-0001");
    XCTAssertEqual(response.type, 4096);
    XCTAssertEqualObjects(response.account, @"8511385");
    
    XCTAssertNotNil(response.messaging);
    XCTAssertEqualObjects(response.messaging.messageId, @"c0591285-652b-4a6c-88b0-05b9f56c1fef");
    XCTAssertEqual(response.messaging.lastRecievedMsgTimeStamp, 0);
    XCTAssertEqualObjects(response.messaging.deliveryStatus, @"delivered");
    XCTAssertEqual(response.messaging.timestamp, 1685594110472);
    XCTAssertEqualObjects(response.messaging.sentBy, @"Agent");
    
    XCTAssertNotNil(response.messaging.message);
    XCTAssertEqual(response.messaging.message.count, 1);
    
    BotMessageInfo *messageInfo = response.messaging.message[0];
    XCTAssertEqual(messageInfo.sendingDelayMillis, 2000);
    XCTAssertEqualObjects(messageInfo.type, @"button");
    
    XCTAssertNotNil(messageInfo.message);
    XCTAssertNotNil(messageInfo.message.attachment);
    
    XCTAssertEqualObjects(messageInfo.message.attachment.type, @"template");
    
    XCTAssertNotNil(messageInfo.message.attachment.payload);
    XCTAssertEqualObjects(messageInfo.message.attachment.payload.templateType, @"button");
    XCTAssertEqualObjects(messageInfo.message.attachment.payload.text, @"Choose one of many - button 4");
    
    XCTAssertNotNil(messageInfo.message.attachment.payload.buttons);
    XCTAssertEqual(messageInfo.message.attachment.payload.buttons.count, 3);
    
    ChatBotButton *button1 = messageInfo.message.attachment.payload.buttons[0];
    XCTAssertEqualObjects(button1.payload, @"544760");
    XCTAssertEqualObjects(button1.title, @"Go to email node");
    XCTAssertEqualObjects(button1.type, @"postback");
    
    ChatBotButton *button2 = messageInfo.message.attachment.payload.buttons[1];
    XCTAssertEqualObjects(button2.title, @"Go to url test");
    XCTAssertEqualObjects(button2.type, @"web_url");
    XCTAssertEqualObjects(button2.url, @"https://stackoverflow.com/questions/48416330/callkit-call-failed-screen-appears?rq=3");
    
    ChatBotButton *button3 = messageInfo.message.attachment.payload.buttons[2];
    XCTAssertEqualObjects(button3.payload, @"545612");
    XCTAssertEqualObjects(button3.title, @"Go to appointment node");
    XCTAssertEqualObjects(button3.type, @"postback");
}

- (void)test_JSON010 {
    // Given
    NSDictionary *jsonDict = @{
        @"botName": @"Test_may_2023",
        @"from": @"0001685527594196-f23c928effffae20-0001",
        @"botid": @"1c2a4387-e8e6-4414-b383-ab7c6f2c1581",
        @"to": @"0001685527594196-f23c928effffae20-0001",
        @"type": @(4096),
        @"account": @"8511385",
        @"messaging": @{
            @"messageId": @"68630cde-c115-4214-8e2e-6be26e8ac1d1",
            @"message": @[
                @{
                    @"sendingDelayMillis": @(2000),
                    @"type": @"text",
                    @"message": @{
                        @"text": @"It's a text"
                    }
                }
            ],
            @"lastRecievedMsgTimeStamp": @(0),
            @"deliveryStatus": @"delivered",
            @"timestamp": @(1685529330576),
            @"sentBy": @"Agent"
        }
    };
    
    // When
    ChatBotResponse *response = [[ChatBotResponse alloc] initWithDictionary:jsonDict];
    
    // Then
    XCTAssertNotNil(response);
    XCTAssertEqualObjects(response.botName, @"Test_may_2023");
    XCTAssertEqualObjects(response.from, @"0001685527594196-f23c928effffae20-0001");
    XCTAssertEqualObjects(response.botid, @"1c2a4387-e8e6-4414-b383-ab7c6f2c1581");
    XCTAssertEqualObjects(response.to, @"0001685527594196-f23c928effffae20-0001");
    XCTAssertEqual(response.type, 4096);
    XCTAssertEqualObjects(response.account, @"8511385");
    
    XCTAssertNotNil(response.messaging);
    XCTAssertEqualObjects(response.messaging.messageId, @"68630cde-c115-4214-8e2e-6be26e8ac1d1");
    XCTAssertEqual(response.messaging.lastRecievedMsgTimeStamp, 0);
    XCTAssertEqualObjects(response.messaging.deliveryStatus, @"delivered");
    XCTAssertEqual(response.messaging.timestamp, 1685529330576);
    XCTAssertEqualObjects(response.messaging.sentBy, @"Agent");
    
    XCTAssertNotNil(response.messaging.message);
    XCTAssertEqual(response.messaging.message.count, 1);
    
    BotMessageInfo *messageInfo = response.messaging.message[0];
    XCTAssertEqual(messageInfo.sendingDelayMillis, 2000);
    XCTAssertEqualObjects(messageInfo.type, @"text");
    
    XCTAssertNotNil(messageInfo.message);
    XCTAssertEqualObjects(messageInfo.message.text, @"It's a text");
}

- (void)test_JSON011 {
    // Given
    NSDictionary *jsonDict = @{
        @"botName": @"Test_may_2023",
        @"from": @"0001685527594196-f23c928effffae20-0001",
        @"botid": @"1c2a4387-e8e6-4414-b383-ab7c6f2c1581",
        @"to": @"0001685527594196-f23c928effffae20-0001",
        @"type": @(4096),
        @"account": @"8511385",
        @"messaging": @{
            @"messageId": @"daf33a0a-8b13-4cac-938f-713bbec38274",
            @"message": @[
                @{
                    @"sendingDelayMillis": @(2000),
                    @"type": @"image",
                    @"message": @{
                        @"attachment": @{
                            @"payload": @{
                                @"url": @"https://preview.revechat.com/files/ef89b3a9-dc39-47b2-b27f-64fb73f3f5bf.jpg"
                            },
                            @"type": @"image"
                        }
                    }
                }
            ],
            @"lastRecievedMsgTimeStamp": @(0),
            @"deliveryStatus": @"delivered",
            @"timestamp": @(1685529580945),
            @"sentBy": @"Agent"
        }
    };
    
    // When
    ChatBotResponse *response = [[ChatBotResponse alloc] initWithDictionary:jsonDict];
    
    // Then
    XCTAssertNotNil(response);
    XCTAssertEqualObjects(response.botName, @"Test_may_2023");
    XCTAssertEqualObjects(response.from, @"0001685527594196-f23c928effffae20-0001");
    XCTAssertEqualObjects(response.botid, @"1c2a4387-e8e6-4414-b383-ab7c6f2c1581");
    XCTAssertEqualObjects(response.to, @"0001685527594196-f23c928effffae20-0001");
    XCTAssertEqual(response.type, 4096);
    XCTAssertEqualObjects(response.account, @"8511385");
    
    XCTAssertNotNil(response.messaging);
    XCTAssertEqualObjects(response.messaging.messageId, @"daf33a0a-8b13-4cac-938f-713bbec38274");
    XCTAssertEqual(response.messaging.lastRecievedMsgTimeStamp, 0);
    XCTAssertEqualObjects(response.messaging.deliveryStatus, @"delivered");
    XCTAssertEqual(response.messaging.timestamp, 1685529580945);
    XCTAssertEqualObjects(response.messaging.sentBy, @"Agent");
    
    XCTAssertNotNil(response.messaging.message);
    XCTAssertEqual(response.messaging.message.count, 1);
    
    BotMessageInfo *messageInfo = response.messaging.message[0];
    XCTAssertEqual(messageInfo.sendingDelayMillis, 2000);
    XCTAssertEqualObjects(messageInfo.type, @"image");
    
    XCTAssertNotNil(messageInfo.message);
    
    XCTAssertNotNil(messageInfo.message.attachment);
    XCTAssertEqualObjects(messageInfo.message.attachment.type, @"image");
    
    XCTAssertNotNil(messageInfo.message.attachment.payload);
    XCTAssertEqualObjects(messageInfo.message.attachment.payload.url, @"https://preview.revechat.com/files/ef89b3a9-dc39-47b2-b27f-64fb73f3f5bf.jpg");
}

- (void)test_JSON012 {
    // Given
    NSDictionary *jsonDict = @{
        @"botName": @"Test_may_2023",
        @"from": @"0001685527594196-f23c928effffae20-0001",
        @"botid": @"1c2a4387-e8e6-4414-b383-ab7c6f2c1581",
        @"to": @"0001685527594196-f23c928effffae20-0001",
        @"type": @(4096),
        @"account": @"8511385",
        @"messaging": @{
            @"messageId": @"3656b7de-cf68-41d4-82ef-8a6673227317",
            @"message": @[
                @{
                    @"sendingDelayMillis": @(2000),
                    @"type": @"question",
                    @"message": @{
                        @"numberOfRepeat": @"1",
                        @"validationType": @"phone",
                        @"attributeName": @"{{phone}}",
                        @"text": @"It's a question node - Enter your number",
                        @"failureMessage": @"You entered wrong number"
                    }
                }
            ],
            @"lastRecievedMsgTimeStamp": @(0),
            @"deliveryStatus": @"delivered",
            @"timestamp": @(1685529806314),
            @"sentBy": @"Agent"
        }
    };
    
    // When
    ChatBotResponse *response = [[ChatBotResponse alloc] initWithDictionary:jsonDict];
    
    // Then
    XCTAssertNotNil(response);
    XCTAssertEqualObjects(response.botName, @"Test_may_2023");
    XCTAssertEqualObjects(response.from, @"0001685527594196-f23c928effffae20-0001");
    XCTAssertEqualObjects(response.botid, @"1c2a4387-e8e6-4414-b383-ab7c6f2c1581");
    XCTAssertEqualObjects(response.to, @"0001685527594196-f23c928effffae20-0001");
    XCTAssertEqual(response.type, 4096);
    XCTAssertEqualObjects(response.account, @"8511385");
    
    XCTAssertNotNil(response.messaging);
    XCTAssertEqualObjects(response.messaging.messageId, @"3656b7de-cf68-41d4-82ef-8a6673227317");
    XCTAssertEqual(response.messaging.lastRecievedMsgTimeStamp, 0);
    XCTAssertEqualObjects(response.messaging.deliveryStatus, @"delivered");
    XCTAssertEqual(response.messaging.timestamp, 1685529806314);
    XCTAssertEqualObjects(response.messaging.sentBy, @"Agent");
    
    XCTAssertNotNil(response.messaging.message);
    XCTAssertEqual(response.messaging.message.count, 1);
    
    BotMessageInfo *messageInfo = response.messaging.message[0];
    XCTAssertEqual(messageInfo.sendingDelayMillis, 2000);
    XCTAssertEqualObjects(messageInfo.type, @"question");
    
    XCTAssertNotNil(messageInfo.message);
    
    XCTAssertEqualObjects(messageInfo.message.numberOfRepeat, @"1");
    XCTAssertEqualObjects(messageInfo.message.validationType, @"phone");
    XCTAssertEqualObjects(messageInfo.message.attributeName, @"{{phone}}");
    XCTAssertEqualObjects(messageInfo.message.text, @"It's a question node - Enter your number");
    XCTAssertEqualObjects(messageInfo.message.failureMessage, @"You entered wrong number");
}

- (void)test_JSON013 {
    // Given
    NSDictionary *jsonDict = @{
        @"botName": @"Test_may_2023",
        @"from": @"0001685527594196-f23c928effffae20-0001",
        @"botid": @"1c2a4387-e8e6-4414-b383-ab7c6f2c1581",
        @"to": @"0001685527594196-f23c928effffae20-0001",
        @"type": @(4096),
        @"account": @"8511385",
        @"messaging": @{
            @"messageId": @"8e0e2fe2-b3cc-4c9a-90f0-8503022d20e6",
            @"message": @[
                @{
                    @"sendingDelayMillis": @(2000),
                    @"type": @"quick_reply",
                    @"message": @{
                        @"quick_replies": @[
                            @{
                                @"content_type": @"text",
                                @"payload": @"544498",
                                @"title": @"Go to leading node"
                            },
                            @{
                                @"content_type": @"text",
                                @"payload": @"544512",
                                @"title": @"Go to email validation node"
                            }
                        ],
                        @"text": @"It's a quick reply test"
                    }
                }
            ],
            @"lastRecievedMsgTimeStamp": @(0),
            @"deliveryStatus": @"delivered",
            @"timestamp": @(1685530260857),
            @"sentBy": @"Agent"
        }
    };
    
    // When
    ChatBotResponse *response = [[ChatBotResponse alloc] initWithDictionary:jsonDict];
    
    // Then
    XCTAssertNotNil(response);
    XCTAssertEqualObjects(response.botName, @"Test_may_2023");
    XCTAssertEqualObjects(response.from, @"0001685527594196-f23c928effffae20-0001");
    XCTAssertEqualObjects(response.botid, @"1c2a4387-e8e6-4414-b383-ab7c6f2c1581");
    XCTAssertEqualObjects(response.to, @"0001685527594196-f23c928effffae20-0001");
    XCTAssertEqual(response.type, 4096);
    XCTAssertEqualObjects(response.account, @"8511385");
    
    XCTAssertNotNil(response.messaging);
    XCTAssertEqualObjects(response.messaging.messageId, @"8e0e2fe2-b3cc-4c9a-90f0-8503022d20e6");
    XCTAssertEqual(response.messaging.lastRecievedMsgTimeStamp, 0);
    XCTAssertEqualObjects(response.messaging.deliveryStatus, @"delivered");
    XCTAssertEqual(response.messaging.timestamp, 1685530260857);
    XCTAssertEqualObjects(response.messaging.sentBy, @"Agent");
    
    XCTAssertNotNil(response.messaging.message);
    XCTAssertEqual(response.messaging.message.count, 1);
    
    BotMessageInfo *messageInfo = response.messaging.message[0];
    XCTAssertEqual(messageInfo.sendingDelayMillis, 2000);
    XCTAssertEqualObjects(messageInfo.type, @"quick_reply");
    
    XCTAssertNotNil(messageInfo.message);
    
    XCTAssertNotNil(messageInfo.message.quickReplies);
    XCTAssertEqual(messageInfo.message.quickReplies.count, 2);
    
    QuickReplies *quickReply1 = messageInfo.message.quickReplies[0];
    XCTAssertEqualObjects(quickReply1.contentType, @"text");
    XCTAssertEqualObjects(quickReply1.payload, @"544498");
    XCTAssertEqualObjects(quickReply1.title, @"Go to leading node");
    
    QuickReplies *quickReply2 = messageInfo.message.quickReplies[1];
    XCTAssertEqualObjects(quickReply2.contentType, @"text");
    XCTAssertEqualObjects(quickReply2.payload, @"544512");
    XCTAssertEqualObjects(quickReply2.title, @"Go to email validation node");
    
    XCTAssertEqualObjects(messageInfo.message.text, @"It's a quick reply test");
}

- (void)test_JSON014 {
    // Given
    NSDictionary *jsonDict = @{
        @"botName": @"Test_may_2023",
        @"from": @"0001685527594196-f23c928effffae20-0001",
        @"botid": @"1c2a4387-e8e6-4414-b383-ab7c6f2c1581",
        @"to": @"0001685527594196-f23c928effffae20-0001",
        @"type": @(4096),
        @"account": @"8511385",
        @"messaging": @{
            @"messageId": @"e276f619-b073-47cc-bc76-2e91890bef4d",
            @"message": @[
                @{
                    @"sendingDelayMillis": @(2000),
                    @"type": @"carousel",
                    @"message": @{
                        @"attachment": @{
                            @"payload": @{
                                @"elements": @[
                                    @{
                                        @"buttons": @[
                                            @{
                                                @"payload": @"544498",
                                                @"title": @"Go to leading node",
                                                @"type": @"postback"
                                            },
                                            @{
                                                @"title": @"Go to url test",
                                                @"type": @"web_url",
                                                @"url": @"https://github.com/daihan054/Weather-app-objective-c-iOS"
                                            }
                                        ],
                                        @"image_url": @"https://preview.revechat.com/files/203dc3e4-9749-4448-85a9-37f16988e911.jpg",
                                        @"subtitle": @"1st page",
                                        @"title": @"id card 1st page",
                                        @"default_action": @{
                                            @"type": @"web_url",
                                            @"url": @"https://github.com/daihan054/Weather-app-objective-c-iOS"
                                        }
                                    },
                                    @{
                                        @"buttons": @[
                                            @{
                                                @"payload": @"544512",
                                                @"title": @"Go to email validation node",
                                                @"type": @"postback"
                                            },
                                            @{
                                                @"title": @"Go to url test",
                                                @"type": @"web_url",
                                                @"url": @"https://stackoverflow.com/questions/51982235/how-to-detect-when-the-rpsystembroadcastpickerview-is-tapped"
                                            }
                                        ],
                                        @"image_url": @"https://preview.revechat.com/files/9f8094e7-c8f7-4bc7-a334-c9be1816dd53.jpg",
                                        @"subtitle": @"id card back side",
                                        @"title": @"id card back side",
                                        @"default_action": @{
                                            @"type": @"web_url",
                                            @"url": @"https://stackoverflow.com/questions/51982235/how-to-detect-when-the-rpsystembroadcastpickerview-is-tapped"
                                        }
                                    }
                                ],
                                @"template_type": @"generic"
                            },
                            @"type": @"template"
                        }
                    }
                }
            ],
            @"lastRecievedMsgTimeStamp": @(0),
            @"deliveryStatus": @"delivered",
            @"timestamp": @(1685530696569),
            @"sentBy": @"Agent"
        }
    };

    // When
    ChatBotResponse *response = [[ChatBotResponse alloc] initWithDictionary:jsonDict];

    // Then
    XCTAssertNotNil(response);
    XCTAssertEqualObjects(response.botName, @"Test_may_2023");
    XCTAssertEqualObjects(response.from, @"0001685527594196-f23c928effffae20-0001");
    XCTAssertEqualObjects(response.botid, @"1c2a4387-e8e6-4414-b383-ab7c6f2c1581");
    XCTAssertEqualObjects(response.to, @"0001685527594196-f23c928effffae20-0001");
    XCTAssertEqual(response.type, 4096);
    XCTAssertEqualObjects(response.account, @"8511385");
    
    XCTAssertNotNil(response.messaging);
    XCTAssertEqualObjects(response.messaging.messageId, @"e276f619-b073-47cc-bc76-2e91890bef4d");
    XCTAssertEqual(response.messaging.message.count, 1);
    
    BotMessageInfo *messageInfo = response.messaging.message.firstObject;
    XCTAssertEqual(messageInfo.sendingDelayMillis, 2000);
    XCTAssertEqualObjects(messageInfo.type, @"carousel");
    
    XCTAssertNotNil(messageInfo.message);
    XCTAssertNotNil(messageInfo.message.attachment);
    
    XCTAssertEqualObjects(messageInfo.message.attachment.type, @"template");
    
    AttachmentPayload* payload = messageInfo.message.attachment.payload;
    XCTAssertEqualObjects(payload.templateType, @"generic");
    
    XCTAssertNotNil(payload.elements);
    XCTAssertEqual(payload.elements.count, 2);
    
    CarouselElement* element1 = payload.elements[0];
    XCTAssertNotNil(element1);
    XCTAssertEqualObjects(element1.imageUrl, @"https://preview.revechat.com/files/203dc3e4-9749-4448-85a9-37f16988e911.jpg");
    XCTAssertEqualObjects(element1.subtitle, @"1st page");
    XCTAssertEqualObjects(element1.title, @"id card 1st page");
    CarouselButton* element1_button1 = payload.elements[0].buttons[0];
    XCTAssertNotNil(element1_button1);
    XCTAssertEqualObjects(element1_button1.payload, @"544498");
    XCTAssertEqualObjects(element1_button1.title, @"Go to leading node");
    XCTAssertEqualObjects(element1_button1.type, @"postback");
    CarouselButton* element1_button2 = payload.elements[0].buttons[1];
    XCTAssertNotNil(element1_button2);
    XCTAssertEqualObjects(element1_button2.title, @"Go to url test");
    XCTAssertEqualObjects(element1_button2.type, @"web_url");
    XCTAssertEqualObjects(element1_button2.url, @"https://github.com/daihan054/Weather-app-objective-c-iOS");
    CarouselButton* element1_defaultAction = element1.defaultAction;
    XCTAssertNotNil(element1_defaultAction);
    XCTAssertEqualObjects(element1_defaultAction.type, @"web_url");
    XCTAssertEqualObjects(element1_defaultAction.url, @"https://github.com/daihan054/Weather-app-objective-c-iOS");
    
    CarouselElement* element2 = payload.elements[1];
    XCTAssertNotNil(element2);
    XCTAssertEqualObjects(element2.imageUrl, @"https://preview.revechat.com/files/9f8094e7-c8f7-4bc7-a334-c9be1816dd53.jpg");
    XCTAssertEqualObjects(element2.subtitle, @"id card back side");
    XCTAssertEqualObjects(element2.title, @"id card back side");
    CarouselButton* element2_button1 = payload.elements[1].buttons[0];
    XCTAssertNotNil(element2_button1);
    XCTAssertEqualObjects(element2_button1.payload, @"544512");
    XCTAssertEqualObjects(element2_button1.title, @"Go to email validation node");
    XCTAssertEqualObjects(element2_button1.type, @"postback");
    CarouselButton* element2_button2 = payload.elements[1].buttons[1];
    XCTAssertNotNil(element2_button2);
    XCTAssertEqualObjects(element2_button2.title, @"Go to url test");
    XCTAssertEqualObjects(element2_button2.type, @"web_url");
    XCTAssertEqualObjects(element2_button2.url, @"https://stackoverflow.com/questions/51982235/how-to-detect-when-the-rpsystembroadcastpickerview-is-tapped");
    CarouselButton* element2_defaultAction = payload.elements[1].defaultAction;
    XCTAssertNotNil(element2_defaultAction);
    XCTAssertEqualObjects(element2_defaultAction.type, @"web_url");
    XCTAssertEqualObjects(element2_defaultAction.url, @"https://stackoverflow.com/questions/51982235/how-to-detect-when-the-rpsystembroadcastpickerview-is-tapped");
}

- (void)test_JSON015 {
    NSDictionary *json = @{
        @"botName": @"Test_may_2023",
        @"from": @"0001685262019998-f23c928effffae20-0001",
        @"botid": @"1c2a4387-e8e6-4414-b383-ab7c6f2c1581",
        @"to": @"0001685262019998-f23c928effffae20-0001",
        @"type": @(4096),
        @"account": @"8511385",
        @"messaging": @{
            @"messageId": @"69add7fe-706d-4e51-919c-7952e140852e",
            @"message": @[
                @{
                    @"sendingDelayMillis": @(2000),
                    @"type": @"text",
                    @"message": @{
                        @"text": @"Your email is in wrong format"
                    }
                }
            ],
            @"lastRecievedMsgTimeStamp": @(0),
            @"deliveryStatus": @"delivered",
            @"timestamp": @(1685263915700),
            @"sentBy": @"Agent"
        }
    };

    ChatBotResponse *response = [[ChatBotResponse alloc] initWithDictionary:json];

    // Perform assertions
    XCTAssertEqualObjects(response.botName, @"Test_may_2023");
    XCTAssertEqualObjects(response.from, @"0001685262019998-f23c928effffae20-0001");
    XCTAssertEqualObjects(response.botid, @"1c2a4387-e8e6-4414-b383-ab7c6f2c1581");
    XCTAssertEqualObjects(response.to, @"0001685262019998-f23c928effffae20-0001");
    XCTAssertEqual(response.type, 4096);
    XCTAssertEqualObjects(response.account, @"8511385");
    XCTAssertEqualObjects(response.messaging.messageId, @"69add7fe-706d-4e51-919c-7952e140852e");
    XCTAssertEqual(response.messaging.lastRecievedMsgTimeStamp, 0);
    XCTAssertEqualObjects(response.messaging.deliveryStatus, @"delivered");
    XCTAssertEqual(response.messaging.timestamp, 1685263915700);
    XCTAssertEqualObjects(response.messaging.sentBy, @"Agent");
    
    NSMutableArray<BotMessageInfo*>* messages = response.messaging.message;
    XCTAssertNotNil(messages);
    XCTAssertEqual(messages.count, 1);
    XCTAssertEqual(messages[0].sendingDelayMillis, 2000);
    XCTAssertEqualObjects(messages[0].type, @"text");
    XCTAssertEqualObjects(messages[0].message.text, @"Your email is in wrong format");
}

- (void)test_JSON016 {
    NSDictionary *json = @{
        @"botName": @"Test_may_2023",
        @"from": @"0001685527594196-f23c928effffae20-0001",
        @"botid": @"1c2a4387-e8e6-4414-b383-ab7c6f2c1581",
        @"to": @"0001685527594196-f23c928effffae20-0001",
        @"type": @(4096),
        @"account": @"8511385",
        @"messaging": @{
            @"messageId": @"98683041-18fd-4502-99f2-5ce8cbb594f2",
            @"message": @[
                @{
                    @"sendingDelayMillis": @(2000),
                    @"type": @"audio",
                    @"message": @{
                        @"attachment": @{
                            @"payload": @{
                                @"url": @"https://file.revechat.com/files/359cf61b-7420-4c03-9587-62cbefd0f99c.mp3"
                            },
                            @"type": @"audio"
                        }
                    }
                }
            ],
            @"lastRecievedMsgTimeStamp": @(0),
            @"deliveryStatus": @"delivered",
            @"timestamp": @(1685544869864),
            @"sentBy": @"Agent"
        }
    };

    ChatBotResponse *response = [[ChatBotResponse alloc] initWithDictionary:json];

    // Perform assertions
    XCTAssertEqualObjects(response.botName, @"Test_may_2023");
    XCTAssertEqualObjects(response.from, @"0001685527594196-f23c928effffae20-0001");
    XCTAssertEqualObjects(response.botid, @"1c2a4387-e8e6-4414-b383-ab7c6f2c1581");
    XCTAssertEqualObjects(response.to, @"0001685527594196-f23c928effffae20-0001");
    XCTAssertEqual(response.type, 4096);
    XCTAssertEqualObjects(response.account, @"8511385");
    XCTAssertEqualObjects(response.messaging.messageId, @"98683041-18fd-4502-99f2-5ce8cbb594f2");
    XCTAssertEqual(response.messaging.lastRecievedMsgTimeStamp, 0);
    XCTAssertEqualObjects(response.messaging.deliveryStatus, @"delivered");
    XCTAssertEqual(response.messaging.timestamp, 1685544869864);
    XCTAssertEqualObjects(response.messaging.sentBy, @"Agent");
    
    NSMutableArray<BotMessageInfo*>* messages = response.messaging.message;
    XCTAssertNotNil(messages);
    XCTAssertEqual(messages.count, 1);
    XCTAssertEqual(messages[0].sendingDelayMillis, 2000);
    XCTAssertEqualObjects(messages[0].type, @"audio");
    XCTAssertEqualObjects(messages[0].message.attachment.type, @"audio");
    XCTAssertEqualObjects(messages[0].message.attachment.payload.url, @"https://file.revechat.com/files/359cf61b-7420-4c03-9587-62cbefd0f99c.mp3");
}

- (void)test_JSON017 {
    NSDictionary *json = @{
        @"botName": @"Test_may_2023",
        @"from": @"0001685527594196-f23c928effffae20-0001",
        @"botid": @"1c2a4387-e8e6-4414-b383-ab7c6f2c1581",
        @"to": @"0001685527594196-f23c928effffae20-0001",
        @"type": @(4096),
        @"account": @"8511385",
        @"messaging": @{
            @"messageId": @"f58c26fe-0aff-400a-9dbf-edfe0c3e707b",
            @"message": @[
                @{
                    @"sendingDelayMillis": @(2000),
                    @"type": @"video",
                    @"message": @{
                        @"attachment": @{
                            @"payload": @{
                                @"url": @"https://file.revechat.com/files/49f570f7-b68d-4e36-bf80-5c1f7d1d5460.mp4"
                            },
                            @"type": @"video"
                        }
                    }
                }
            ],
            @"lastRecievedMsgTimeStamp": @(0),
            @"deliveryStatus": @"delivered",
            @"timestamp": @(1685545096877),
            @"sentBy": @"Agent"
        }
    };

    ChatBotResponse *response = [[ChatBotResponse alloc] initWithDictionary:json];

    // Perform assertions
    XCTAssertEqualObjects(response.botName, @"Test_may_2023");
    XCTAssertEqualObjects(response.from, @"0001685527594196-f23c928effffae20-0001");
    XCTAssertEqualObjects(response.botid, @"1c2a4387-e8e6-4414-b383-ab7c6f2c1581");
    XCTAssertEqualObjects(response.to, @"0001685527594196-f23c928effffae20-0001");
    XCTAssertEqual(response.type, 4096);
    XCTAssertEqualObjects(response.account, @"8511385");
    XCTAssertEqualObjects(response.messaging.messageId, @"f58c26fe-0aff-400a-9dbf-edfe0c3e707b");
    XCTAssertEqual(response.messaging.lastRecievedMsgTimeStamp, 0);
    XCTAssertEqualObjects(response.messaging.deliveryStatus, @"delivered");
    XCTAssertEqual(response.messaging.timestamp, 1685545096877);
    XCTAssertEqualObjects(response.messaging.sentBy, @"Agent");
    
    NSMutableArray<BotMessageInfo*>* messages = response.messaging.message;
    XCTAssertNotNil(messages);
    XCTAssertEqual(messages.count, 1);

    BotMessageInfo *messageInfo = messages[0];
    XCTAssertEqual(messageInfo.sendingDelayMillis, 2000);
    XCTAssertEqualObjects(messageInfo.type, @"video");

    Attachment *attachment = messageInfo.message.attachment;
    XCTAssertEqualObjects(attachment.type, @"video");
    XCTAssertEqualObjects(attachment.payload.url, @"https://file.revechat.com/files/49f570f7-b68d-4e36-bf80-5c1f7d1d5460.mp4");
}

- (void)test_JSON018 {
    NSDictionary *json = @{
        @"botName": @"Test_may_2023",
        @"from": @"0001685527594196-f23c928effffae20-0001",
        @"botid": @"1c2a4387-e8e6-4414-b383-ab7c6f2c1581",
        @"to": @"0001685527594196-f23c928effffae20-0001",
        @"type": @(4096),
        @"account": @"8511385",
        @"messaging": @{
            @"messageId": @"cff38128-fac0-4d37-af6d-ee9d7bcf2365",
            @"message": @[
                @{
                    @"type": @"chat_transfer",
                    @"message": @{
                        @"transferMsg": @"Hey one of our agent is online. You can talk with him."
                    },
                    @"status": @"pending"
                }
            ],
            @"lastRecievedMsgTimeStamp": @(0),
            @"deliveryStatus": @"delivered",
            @"timestamp": @(1685548730595),
            @"sentBy": @"Agent"
        }
    };

    ChatBotResponse *response = [[ChatBotResponse alloc] initWithDictionary:json];

    // Perform assertions
    XCTAssertEqualObjects(response.botName, @"Test_may_2023");
    XCTAssertEqualObjects(response.from, @"0001685527594196-f23c928effffae20-0001");
    XCTAssertEqualObjects(response.botid, @"1c2a4387-e8e6-4414-b383-ab7c6f2c1581");
    XCTAssertEqualObjects(response.to, @"0001685527594196-f23c928effffae20-0001");
    XCTAssertEqual(response.type, 4096);
    XCTAssertEqualObjects(response.account, @"8511385");
    XCTAssertEqualObjects(response.messaging.messageId, @"cff38128-fac0-4d37-af6d-ee9d7bcf2365");
    XCTAssertEqual(response.messaging.lastRecievedMsgTimeStamp, 0);
    XCTAssertEqualObjects(response.messaging.deliveryStatus, @"delivered");
    XCTAssertEqual(response.messaging.timestamp, 1685548730595);
    XCTAssertEqualObjects(response.messaging.sentBy, @"Agent");

    NSMutableArray<BotMessageInfo *> *messages = response.messaging.message;
    XCTAssertNotNil(messages);
    XCTAssertEqual(messages.count, 1);

    BotMessageInfo *messageInfo = messages[0];
    XCTAssertNotNil(messageInfo);
    XCTAssertEqualObjects(messageInfo.type, @"chat_transfer");
    XCTAssertEqualObjects(messageInfo.status, @"pending");
    XCTAssertEqualObjects(messageInfo.message.transferMsg, @"Hey one of our agent is online. You can talk with him.");
}

- (void)test_JSON019 {
    NSNumber *typeNumber = @4096;
    NSNumber *timestampNumber = @1685587399643;
    NSNumber *lastReceivedMsgTimestampNumber = @0;
    NSString *status1Number = @"1";
    NSString *status0Number = @"0";
    BOOL googleLoginTrue = YES;

    NSDictionary *appointmentButtonPayload = @{
        @"type": @"calendar",
        @"value": @"calender"
    };

    NSDictionary *appointmentButton = @{
        @"payload": appointmentButtonPayload,
        @"title": @"Select your slot",
        @"type": @"postback"
    };

    NSDictionary *appointmentPayload = @{
        @"buttons": @[appointmentButton],
        @"template_type": @"button",
        @"text": @"Test for bot"
    };

    NSDictionary *appointmentAttachment = @{
        @"payload": appointmentPayload,
        @"type": @"template"
    };

    NSDictionary *appointmentMessage = @{
        @"meeting_title": @"Test for bot",
        @"available_datetime": @[
            @{
                @"from": @"09:00 am",
                @"to": @"06:00 pm",
                @"day": @"sunday",
                @"status": status1Number
            },
            @{
                @"from": @"09:00 am",
                @"to": @"06:00 pm",
                @"day": @"monday",
                @"status": status0Number
            },
            @{
                @"from": @"09:00 am",
                @"to": @"06:00 pm",
                @"day": @"tuesday",
                @"status": status1Number
            },
            @{
                @"from": @"09:00 am",
                @"to": @"06:00 pm",
                @"day": @"wednesday",
                @"status": status0Number
            },
            @{
                @"from": @"09:00 am",
                @"to": @"06:00 pm",
                @"day": @"thursday",
                @"status": status1Number
            },
            @{
                @"from": @"09:00 am",
                @"to": @"06:00 pm",
                @"day": @"friday",
                @"status": status0Number
            },
            @{
                @"from": @"09:00 am",
                @"to": @"06:00 pm",
                @"day": @"saturday",
                @"status": status1Number
            }
        ],
        @"meeting_description": @"Test for bot",
        @"slot_not_available_msg": @"Sorry no slots available",
        @"meeting_timezone": @"Asia/Dhaka",
        @"attachment": appointmentAttachment,
        @"google_login": @(googleLoginTrue),
        @"success_msg": @"Appointment confirmed horray!!",
        @"heading_text": @"Test for bot",
        @"meeting_duration": @"30"
    };

    NSDictionary *messagingDict = @{
        @"messageId": @"22384b1a-a1f1-4c36-9acc-d216bb0f319f",
        @"message": @[@{
            @"type": @"appointment",
            @"message": appointmentMessage
        }],
        @"lastRecievedMsgTimeStamp": lastReceivedMsgTimestampNumber,
        @"deliveryStatus": @"delivered",
        @"timestamp": timestampNumber,
        @"sentBy": @"Agent"
    };

    NSDictionary *jsonDict = @{
        @"botName": @"Test_may_2023",
        @"from": @"0001685527594196-f23c928effffae20-0001",
        @"botid": @"1c2a4387-e8e6-4414-b383-ab7c6f2c1581",
        @"to": @"0001685527594196-f23c928effffae20-0001",
        @"type": typeNumber,
        @"account": @"8511385",
        @"messaging": messagingDict
    };
    
    AppointmentData *appointmentData = [[AppointmentData alloc] initWithDictionary:jsonDict];
    XCTAssertNotNil(appointmentData);
    XCTAssertEqualObjects(appointmentData.botName, @"Test_may_2023");
    XCTAssertEqualObjects(appointmentData.from, @"0001685527594196-f23c928effffae20-0001");
    XCTAssertEqualObjects(appointmentData.botid, @"1c2a4387-e8e6-4414-b383-ab7c6f2c1581");
    XCTAssertEqualObjects(appointmentData.to, @"0001685527594196-f23c928effffae20-0001");
    XCTAssertEqual(appointmentData.type, 4096);
    XCTAssertEqualObjects(appointmentData.account, @"8511385");
    
    XCTAssertNotNil(appointmentData.messaging);
    XCTAssertEqualObjects(appointmentData.messaging.messageId, @"22384b1a-a1f1-4c36-9acc-d216bb0f319f");
    XCTAssertEqual(appointmentData.messaging.lastReceivedMsgTimeStamp, 0);
    XCTAssertEqualObjects(appointmentData.messaging.deliveryStatus, @"delivered");
    XCTAssertEqual(appointmentData.messaging.timestamp,1685587399643);
    XCTAssertEqual(appointmentData.messaging.sentBy, @"Agent");
    
    NSMutableArray<AppointmentMessage*>* messages = appointmentData.messaging.message;
    XCTAssertNotNil(messages);
    XCTAssertEqual(messages.count, 1);
    
    AppointmentMessage* message = messages[0];
    XCTAssertNotNil(message);
    XCTAssertEqualObjects(message.type, @"appointment");
    
    AppointmentInfo* appointmentInfo = messages[0].message;
    XCTAssertNotNil(appointmentInfo);
    XCTAssertEqualObjects(appointmentInfo.meetingTitle, @"Test for bot");
    XCTAssertEqualObjects(appointmentInfo.meetingDescription, @"Test for bot");
    XCTAssertEqualObjects(appointmentInfo.slotNotAvailableMsg, @"Sorry no slots available");
    XCTAssertEqualObjects(appointmentInfo.meetingTimezone, @"Asia/Dhaka");
    XCTAssertTrue(appointmentInfo.googleLogin);
    XCTAssertEqualObjects(appointmentInfo.successMsg, @"Appointment confirmed horray!!");
    XCTAssertEqualObjects(appointmentInfo.headingText, @"Test for bot");
    XCTAssertEqualObjects(appointmentInfo.meetingDuration, @"30");
    
    NSMutableArray<AppointmentTime*>* availableDateTime = appointmentInfo.availableDateTime;
    XCTAssertNotNil(availableDateTime);
    XCTAssertEqualObjects(availableDateTime[0].from, @"09:00 am");
    XCTAssertEqualObjects(availableDateTime[0].to, @"06:00 pm");
    XCTAssertEqualObjects(availableDateTime[0].day, @"sunday");
    XCTAssertEqualObjects(availableDateTime[0].status, @"1");
    
    XCTAssertEqualObjects(availableDateTime[1].from, @"09:00 am");
    XCTAssertEqualObjects(availableDateTime[1].to, @"06:00 pm");
    XCTAssertEqualObjects(availableDateTime[1].day, @"monday");
    XCTAssertEqualObjects(availableDateTime[1].status, @"0");
    
    XCTAssertEqualObjects(availableDateTime[2].from, @"09:00 am");
    XCTAssertEqualObjects(availableDateTime[2].to, @"06:00 pm");
    XCTAssertEqualObjects(availableDateTime[2].day, @"tuesday");
    XCTAssertEqualObjects(availableDateTime[2].status, @"1");
    
    XCTAssertEqualObjects(availableDateTime[3].from, @"09:00 am");
    XCTAssertEqualObjects(availableDateTime[3].to, @"06:00 pm");
    XCTAssertEqualObjects(availableDateTime[3].day, @"wednesday");
    XCTAssertEqualObjects(availableDateTime[3].status, @"0");
    
    XCTAssertEqualObjects(availableDateTime[4].from, @"09:00 am");
    XCTAssertEqualObjects(availableDateTime[4].to, @"06:00 pm");
    XCTAssertEqualObjects(availableDateTime[4].day, @"thursday");
    XCTAssertEqualObjects(availableDateTime[4].status, @"1");
    
    XCTAssertEqualObjects(availableDateTime[5].from, @"09:00 am");
    XCTAssertEqualObjects(availableDateTime[5].to, @"06:00 pm");
    XCTAssertEqualObjects(availableDateTime[5].day, @"friday");
    XCTAssertEqualObjects(availableDateTime[5].status, @"0");
    
    XCTAssertEqualObjects(availableDateTime[6].from, @"09:00 am");
    XCTAssertEqualObjects(availableDateTime[6].to, @"06:00 pm");
    XCTAssertEqualObjects(availableDateTime[6].day, @"saturday");
    XCTAssertEqualObjects(availableDateTime[6].status, @"1");
    
    XCTAssertEqualObjects(appointmentInfo.attachment.type, @"template");
    XCTAssertNotNil(appointmentInfo.attachment.payload);
    
    NSMutableArray<AppointmentButton*>* buttons = appointmentInfo.attachment.payload.buttons;
    XCTAssertNotNil(buttons);
    XCTAssertEqual(buttons.count, 1);
    XCTAssertEqualObjects(buttons[0].title, @"Select your slot");
    XCTAssertEqualObjects(buttons[0].type, @"postback");
    XCTAssertEqualObjects(buttons[0].payload.type, @"calendar");
    XCTAssertEqualObjects(buttons[0].payload.value, @"calender");
}

- (void)test_JSON020 {
    NSDictionary *json = @{
        @"botName": @"Test_may_2023",
        @"from": @"0001685527594196-f23c928effffae20-0001",
        @"botid": @"1c2a4387-e8e6-4414-b383-ab7c6f2c1581",
        @"to": @"0001685527594196-f23c928effffae20-0001",
        @"type": @(4096),
        @"account": @"8511385",
        @"messaging": @{
            @"messageId": @"baa7cfca-cf4b-4781-8633-51f83c627b85",
            @"message": @[
                @{
                    @"type": @"text",
                    @"message": @{
                        @"addEvent": @{
                            @"summary": @"Test for bot",
                            @"attendees": @[
                                @{
                                    @"name": @"Daihan",
                                    @"email": @"daihan@revesoft.com"
                                }
                            ],
                            @"slotNotAvailableMsg": @"Sorry no slots available",
                            @"description": @"Test for bot",
                            @"startTime": @(1686632400000),
                            @"endTime": @(1686634200000),
                            @"title": @"2023-06-13 11:00 AM (UTC +06:00)",
                            @"successMessage": @"Appointment confirmed horray!!",
                            @"meetingTimezone": @"Asia/Dhaka"
                        },
                        @"text": @"Appointment confirmed horray!!"
                    }
                }
            ],
            @"lastRecievedMsgTimeStamp": @(0),
            @"deliveryStatus": @"delivered",
            @"timestamp": @(1685588109380),
            @"sentBy": @"Agent"
        }
    };

    ChatBotResponse *response = [[ChatBotResponse alloc] initWithDictionary:json];

    // Perform assertions
    XCTAssertEqualObjects(response.botName, @"Test_may_2023");
    XCTAssertEqualObjects(response.from, @"0001685527594196-f23c928effffae20-0001");
    XCTAssertEqualObjects(response.botid, @"1c2a4387-e8e6-4414-b383-ab7c6f2c1581");
    XCTAssertEqualObjects(response.to, @"0001685527594196-f23c928effffae20-0001");
    XCTAssertEqual(response.type, 4096);
    XCTAssertEqualObjects(response.account, @"8511385");
    XCTAssertEqualObjects(response.messaging.messageId, @"baa7cfca-cf4b-4781-8633-51f83c627b85");
    XCTAssertEqual(response.messaging.lastRecievedMsgTimeStamp, 0);
    XCTAssertEqualObjects(response.messaging.deliveryStatus, @"delivered");
    XCTAssertEqual(response.messaging.timestamp, 1685588109380);
    XCTAssertEqualObjects(response.messaging.sentBy, @"Agent");

    NSMutableArray<BotMessageInfo *> *messages = response.messaging.message;
    XCTAssertNotNil(messages);
    XCTAssertEqual(messages.count, 1);

    BotMessageInfo *messageInfo = messages[0];
    XCTAssertEqualObjects(messageInfo.type, @"text");
    XCTAssertEqualObjects(messageInfo.message.text, @"Appointment confirmed horray!!");

    AppointmentEvent *addEvent = messageInfo.message.addEvent;
    XCTAssertEqualObjects(addEvent.summary, @"Test for bot");
    XCTAssertEqualObjects(addEvent.slotNotAvailableMsg, @"Sorry no slots available");
    XCTAssertEqualObjects(addEvent.eventDescription, @"Test for bot");
    XCTAssertEqual(addEvent.startTime, 1686632400000);
    XCTAssertEqual(addEvent.endTime, 1686634200000);
    XCTAssertEqualObjects(addEvent.title, @"2023-06-13 11:00 AM (UTC +06:00)");
    XCTAssertEqualObjects(addEvent.successMessage, @"Appointment confirmed horray!!");
    XCTAssertEqualObjects(addEvent.meetingTimezone, @"Asia/Dhaka");
    
    XCTAssertNotNil(addEvent.attendees);
    XCTAssertEqual(addEvent.attendees.count, 1);
    XCTAssertEqualObjects(addEvent.attendees[0].name, @"Daihan");
    XCTAssertEqualObjects(addEvent.attendees[0].email, @"daihan@revesoft.com");
}

- (void)test_JSON021 {
    NSDictionary *json = @{
        @"botName": @"Test_may_2023",
        @"from": @"0001685262019998-f23c928effffae20-0001",
        @"botid": @"1c2a4387-e8e6-4414-b383-ab7c6f2c1581",
        @"to": @"0001685262019998-f23c928effffae20-0001",
        @"type": @(4096),
        @"account": @"8511385",
        @"messaging": @{
            @"messageId": @"be5f4b66-2a5b-438b-8bd3-5a7c7c866e10",
            @"message": @[
                @{
                    @"type": @"text",
                    @"message": @{
                        @"text": @"Sorry! I am still learning :) Can you please be more specific to your query?"
                    }
                }
            ],
            @"lastRecievedMsgTimeStamp": @(0),
            @"deliveryStatus": @"delivered",
            @"timestamp": @(1685268088921),
            @"sentBy": @"Agent"
        }
    };

    ChatBotResponse *response = [[ChatBotResponse alloc] initWithDictionary:json];

    // Perform assertions
    XCTAssertEqualObjects(response.botName, @"Test_may_2023");
    XCTAssertEqualObjects(response.from, @"0001685262019998-f23c928effffae20-0001");
    XCTAssertEqualObjects(response.botid, @"1c2a4387-e8e6-4414-b383-ab7c6f2c1581");
    XCTAssertEqualObjects(response.to, @"0001685262019998-f23c928effffae20-0001");
    XCTAssertEqual(response.type, 4096);
    XCTAssertEqualObjects(response.account, @"8511385");
    XCTAssertEqualObjects(response.messaging.messageId, @"be5f4b66-2a5b-438b-8bd3-5a7c7c866e10");
    XCTAssertEqual(response.messaging.lastRecievedMsgTimeStamp, 0);
    XCTAssertEqualObjects(response.messaging.deliveryStatus, @"delivered");
    XCTAssertEqual(response.messaging.timestamp, 1685268088921);
    XCTAssertEqualObjects(response.messaging.sentBy, @"Agent");

    NSMutableArray<BotMessageInfo *> *messages = response.messaging.message;
    XCTAssertNotNil(messages);
    XCTAssertEqual(messages.count, 1);

    BotMessageInfo *messageInfo = messages[0];
    XCTAssertEqualObjects(messageInfo.message.text, @"Sorry! I am still learning :) Can you please be more specific to your query?");
    XCTAssertEqualObjects(messageInfo.type, @"text");
}


@end
