//
//  ViewController.h
//  103
//
//  Created by Phuong Nguyen on 4/9/14.
//  Copyright (c) 2014 Phuong Nguyen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (nonatomic,retain) IBOutlet UILabel *lable1;
@property (nonatomic,retain) IBOutlet UITableView *tableView;
@property (nonatomic,retain) IBOutlet UITableViewCell *tablecell1;
-(IBAction)buttonclick:(id)sender;



@end
