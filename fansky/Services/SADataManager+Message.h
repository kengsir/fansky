//
//  SADataManager+Message.h
//  fansky
//
//  Created by Zzy on 9/20/15.
//  Copyright © 2015 Zzy. All rights reserved.
//

#import "SADataManager.h"

@class SAMessage;
@class SAUser;

@interface SADataManager (Message)

- (void)insertOrUpdateMessagesWithObjects:(id)objects;
- (SAMessage *)insertOrUpdateMessageWithObject:(id)object localUser:(SAUser *)localUser;
- (NSArray *)currentMessageWithUserID:(NSString *)userID localUserID:(NSString *)localUserID limit:(NSUInteger)limit;

@end
