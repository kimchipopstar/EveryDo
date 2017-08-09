//
//  DetailViewController.h
//  EveryDo
//
//  Created by Jaewon Kim on 2017-08-08.
//  Copyright © 2017 Jaewon Kim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Todo.h"

@interface DetailViewController : UIViewController

@property (strong, nonatomic) Todo *todoDetailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;




@end

