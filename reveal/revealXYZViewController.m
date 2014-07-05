//
//  revealXYZViewController.m
//  reveal
//
//  Created by Tim Cherry on 7/4/14.
//  Copyright (c) 2014 Tim Cherry. All rights reserved.
//

#import "revealXYZViewController.h"

@interface revealXYZViewController ()
@end

@implementation revealXYZViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)loadInitialData {
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL
                                                          URLWithString:@"http://localhost:8000/api"]];
    NSData *response = [NSURLConnection sendSynchronousRequest:request
                                             returningResponse:nil error:nil];
    
    NSError *jsonParsingError = nil;
    NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:response options:0 error: &jsonParsingError];
    
    NSLog(@"Reply: %@", jsonArray);
    
    for(NSDictionary *item in jsonArray) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 30, 250, 15)];
        
        label.text = [item valueForKey
                     :@"hidden_comment"];
        
        UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, 250, 15)];
        
        label1.text =[item valueForKeyPath
                      :@"company"];
        
        UIView *myView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 100)];
        
        [myView addSubview:label];
        [myView addSubview:label1];
        
        [self.view  addSubview: myView];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //[self.view setBackgroundColor:[UIColor blackColor]];
    [self loadInitialData];
//
//    NSString *foobar = @"abcdefg";
//    self.textLabel.text = foobar;
//    
//    NSString *foobaz = @"Livefyre";
//    self.companyLabel.text = foobaz;

    
    // Do any additional setup after loading the view.
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
