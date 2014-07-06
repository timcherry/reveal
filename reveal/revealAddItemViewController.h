//
//  AddItemViewController.h
//  reveal
//
//  Created by Tim Cherry on 5/5/14.
//  Copyright (c) 2014 Tim Cherry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface revealAddItemViewController : UIViewController{
    IBOutlet UIScrollView *scroller;
}
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end
