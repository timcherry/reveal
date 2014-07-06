//
//  AddItemViewController.m
//  reveal
//
//  Created by Tim Cherry on 5/5/14.
//  Copyright (c) 2014 Tim Cherry. All rights reserved.
//

#import "revealAddItemViewController.h"

@interface revealAddItemViewController ()
@property (weak, nonatomic) IBOutlet UITextView *commentTextField;
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextField *companyTextField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;
@property (weak, nonatomic) IBOutlet UITextField *TextField;
@property (weak, nonatomic) IBOutlet UITextField *commentBox;

@end

@implementation revealAddItemViewController
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if (sender != self.doneButton) return;
    if (self.companyTextField.text.length > 0) {
        NSLog(self.companyTextField.text);
        NSLog(self.titleTextField.text);
        NSLog(self.commentTextField.text);
    }
}

- (IBAction)textField:(id)sender {
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)loadTextView
{
    CGRect frameRect = self.commentBox.frame;
    frameRect.size.height = 240;
    self.commentBox.frame = frameRect;
    
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadTextView];
    [scroller setScrollEnabled:YES];
    [scroller setContentSize:CGSizeMake(320, 1000)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
