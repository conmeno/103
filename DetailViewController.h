//
//  DetailViewController.h
//  103
//
//  Created by Phuong Nguyen on 4/12/14.
//  Copyright (c) 2014 Phuong Nguyen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController{
    //NSString *MainURL;
}
@property NSString *MainURL;
@property (nonatomic,retain) IBOutlet UIImageView *img1;
-(IBAction)changeImage:(id)sender;
//@property (nonatomic,retain) IBOutlet UISwipeGestureRecognizer *swipe1;
- (IBAction)nextSwipe:(UISwipeGestureRecognizer *)recognizer;
-(void)NextImage;


@end
