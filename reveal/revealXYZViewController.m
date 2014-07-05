//
//  revealXYZViewController.m
//  reveal
//
//  Created by Tim Cherry on 7/4/14.
//  Copyright (c) 2014 Tim Cherry. All rights reserved.
//

#import "revealXYZViewController.h"

@interface revealXYZViewController ()
@property (weak, nonatomic) IBOutlet UILabel *textLabel;
@property (weak, nonatomic) IBOutlet UILabel *companyLabel;

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
        self.textLabel.text = [item valueForKey
                               :@"hidden_comment"];
        self.companyLabel.text = [item valueForKeyPath
                                  :@"company"];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
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
