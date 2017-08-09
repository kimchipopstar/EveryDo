//
//  AddViewController.m
//  EveryDo
//
//  Created by Jaewon Kim on 2017-08-08.
//  Copyright © 2017 Jaewon Kim. All rights reserved.
//

#import "AddViewController.h"
#import "MasterViewController.h"


@interface AddViewController ()

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;

@property (weak, nonatomic) IBOutlet UITextField *discriptionTextField;

@property (weak, nonatomic) IBOutlet UITextField *priorityTextField;

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)doneButtom:(UIButton *)sender {
    
    Todo *newTodo = [self createToDo];
    [self.delegate getToDo:newTodo];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)backgroundTapped:(UITapGestureRecognizer *)sender {
    [self.view endEditing:YES];
    
}

-(Todo*)createToDo{

    Todo *todo = [[Todo alloc]initWithTitle:self.titleTextField.text todoDescription:self.discriptionTextField.text priorityNumber:[self.priorityTextField.text intValue] isCompletedIndicator:NO];
    
    return todo;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
