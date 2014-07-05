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
    
    float width = self.view.bounds.size.width;
    float height = 320;
    float xPos = 0;
    float yPos = 20;
    
    float bottomHeight = 30;
    float bottomYPos = height - bottomHeight;
    
    UIScrollView* scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    scrollView.scrollEnabled = YES;
    scrollView.showsVerticalScrollIndicator = YES;
    scrollView.contentSize = CGSizeMake(self.view.bounds.size.width, height*[jsonArray count]);
    [self.view addSubview:scrollView];
    
    for(NSDictionary *item in jsonArray){
        UILabel *comment = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 250, 200)];
        
        comment.text = [item valueForKey
                     :@"hidden_comment"];
        
        UILabel *date = [[UILabel alloc] initWithFrame:CGRectMake(10, bottomYPos, 200, bottomHeight)];
        
        date.text =[item valueForKeyPath
                    :@"pretty_date"];
        
        date.adjustsFontSizeToFitWidth = YES;
        
        UILabel *company = [[UILabel alloc] initWithFrame:CGRectMake(200, bottomYPos, 120, bottomHeight)];
        
        company.text =[item valueForKeyPath
                      :@"company"];
        company.adjustsFontSizeToFitWidth = YES;
        
        UIView *myView = [[UIView alloc] initWithFrame:CGRectMake(xPos, yPos, width, height)];
        
        
        // Random Color
        CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
        CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
        CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
        UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
        myView.backgroundColor = color;
        
        yPos += height;
        
        [myView addSubview:comment];
        [myView addSubview:company];
        [myView addSubview:date];
        
        [scrollView  addSubview: myView];
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
