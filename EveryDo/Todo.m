//
//  Todo.m
//  EveryDo
//
//  Created by Jaewon Kim on 2017-08-08.
//  Copyright © 2017 Jaewon Kim. All rights reserved.
//

#import "Todo.h"

@implementation Todo

- (instancetype)initWithTitle:(NSString*)title todoDescription:(NSString*)todoDescription priorityNumber:(NSInteger)priorityNumber isCompletedIndicator:(BOOL)isCompletedIndicator
{
    self = [super init];
    if (self) {
        _title = title;
        _todoDescription = todoDescription;
        _priorityNumber = priorityNumber;
        _isCompletedIndicator = isCompletedIndicator;
    }
    return self;
}

@end
