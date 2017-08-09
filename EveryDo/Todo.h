//
//  Todo.h
//  EveryDo
//
//  Created by Jaewon Kim on 2017-08-08.
//  Copyright © 2017 Jaewon Kim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Todo : NSObject

@property NSString *title;
@property NSString *todoDescription;
@property NSInteger priorityNumber;
@property BOOL isCompletedIndicator;

- (instancetype)initWithTitle:(NSString*)title todoDescription:(NSString*)todoDescription priorityNumber:(NSInteger)priorityNumber isCompletedIndicator:(BOOL)isCompletedIndicator;


@end
