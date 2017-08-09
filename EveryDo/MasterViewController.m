//
//  MasterViewController.m
//  EveryDo
//
//  Created by Jaewon Kim on 2017-08-08.
//  Copyright © 2017 Jaewon Kim. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "Todo.h"
#import "MyTableViewCell.h"
#import "AddViewController.h"

@interface MasterViewController () <myProtocol>

@property NSMutableArray *todoArray;

@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    
    Todo *todo1 = [[Todo alloc]initWithTitle:@"Bootcamp" todoDescription:@"9am to 9pm" priorityNumber:1 isCompletedIndicator:NO];
    Todo *todo2 = [[Todo alloc]initWithTitle:@"Breakfast" todoDescription:@"7am to 8am" priorityNumber:2 isCompletedIndicator:NO];
    Todo *todo3 = [[Todo alloc]initWithTitle:@"Lunch" todoDescription:@"12pm to 1pm" priorityNumber:3 isCompletedIndicator:NO];
    
    self.todoArray = [NSMutableArray arrayWithObjects:todo1,todo2,todo3, nil];
    
    
    
}


- (void)viewWillAppear:(BOOL)animated {
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)insertNewObject:(id)sender {
    //    if (!self.todoArray) {
    //        self.todoArray = [[NSMutableArray alloc] init];
    //    }
    //    [self.todoArray insertObject:[[Todo alloc]init] atIndex:0];
    //    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    //    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    AddViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"addID"];
    vc.delegate = self;
    [self presentViewController:vc animated:YES completion:nil];

}

#pragma makr - Delegate

-(void)getToDo:(Todo *)todo{
    
    [self.todoArray addObject:todo];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.todoArray.count-1 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];

}



#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        DetailViewController *controller = (DetailViewController *)[segue destinationViewController];
        controller.todoDetailItem = self.todoArray[indexPath.row];

    }
}




#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.todoArray.count;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
  Todo *todo = self.todoArray[indexPath.row];
    
    cell.descriptionLabel.text = todo.todoDescription;
    cell.whatLabel.text = todo.title;
    cell.priorityLabel.text = @(todo.priorityNumber).stringValue;
    
    return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.todoArray removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}
- (IBAction)todoSwiped:(UISwipeGestureRecognizer *)sender {
    
    CGPoint point = [sender locationInView:self.view];
    NSIndexPath *index = [self.tableView indexPathForRowAtPoint:point];
    MyTableViewCell *cell = [self.tableView cellForRowAtIndexPath:index];
    
     NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:((Todo*)self.todoArray[index.row]).title];
    [attributeString addAttribute:NSStrikethroughStyleAttributeName
                            value:@2
                            range:NSMakeRange(0, [attributeString length])];
    
    cell.whatLabel.attributedText = attributeString;
    

}


@end
