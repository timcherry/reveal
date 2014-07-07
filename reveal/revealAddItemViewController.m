//
//  AddItemViewController.m
//  reveal
//
//  Created by Tim Cherry on 5/5/14.
//  Copyright (c) 2014 Tim Cherry. All rights reserved.
//

#import "revealAddItemViewController.h"

//#import "IOSLinkedInAPI/LIALinkedInApplication.h"
//#import "IOSLinkedInAPI/LIALinkedInHttpClient.h"

@interface revealAddItemViewController ()
@property (weak, nonatomic) IBOutlet UITextView *commentTextField;
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextField *companyTextField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;
@property (weak, nonatomic) IBOutlet UITextField *TextField;

@end

@implementation revealAddItemViewController
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if (sender != self.doneButton) return;
    if (self.companyTextField.text.length > 0) {
        
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://localhost:8000/post"]];
        [request setHTTPMethod:@"POST"];
        
        
        
        NSError *jsonParsingError = nil;
        NSDictionary *postDict = [NSDictionary dictionaryWithObjectsAndKeys:
                                  self.companyTextField.text, @"company",
                                  self.titleTextField.text, @"position",
                                  self.commentTextField.text, @"comment", nil];
        
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:postDict options:NSJSONWritingPrettyPrinted error:&jsonParsingError];
            
        NSString *postString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        
        
        NSLog(@"Posting %@", postString);

        [request setHTTPBody:[postString dataUsingEncoding:NSUTF8StringEncoding]];
        
        NSData *response = [NSURLConnection sendSynchronousRequest:request
                                                 returningResponse:nil error:nil];
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

- (void) linkedInClient{
    /*LIALinkedInApplication *application = [LIALinkedInApplication applicationWithRedirectURL:
                                           @"http://www.ancientprogramming.com/liaexample"
                                           clientId:@"clientId"
                                           clientSecret:@"clientSecret"
                                           state:@"DCEEFWF45453sdffef424"
                                           grantedAccess:@[@"r_fullprofile", @"r_network"]];
    return [LIALinkedInHttpClient clientForApplication:application presentingViewController:nil];*/
}

- (void)commentBoxBorder{
    self.commentTextField.layer.cornerRadius=8.0f;
    //self.commentTextField.layer.masksToBounds=YES;
    self.commentTextField.layer.borderColor=[[UIColor grayColor]CGColor];
    self.commentTextField.layer.borderWidth= 0.2f;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self commentBoxBorder];
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
