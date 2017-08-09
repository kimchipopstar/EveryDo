//
//  AddViewController.h
//  EveryDo
//
//  Created by Jaewon Kim on 2017-08-08.
//  Copyright © 2017 Jaewon Kim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Todo.h"

@protocol myProtocol <NSObject>

-(void)getToDo:(Todo*)todo;

@end

@interface AddViewController : UIViewController

@property (nonatomic,weak) id <myProtocol> delegate;

@end
