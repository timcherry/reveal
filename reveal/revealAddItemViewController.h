//
//  AddItemViewController.h
//  reveal
//
//  Created by Tim Cherry on 5/5/14.
//  Copyright (c) 2014 Tim Cherry. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "revealListItem.h"

@interface revealAddItemViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *textField;

@property revealListItem *toDoItem;

@end
