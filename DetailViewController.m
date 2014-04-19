//
//  DetailViewController.m
//  103
//
//  Created by Phuong Nguyen on 4/12/14.
//  Copyright (c) 2014 Phuong Nguyen. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController
@synthesize img1;
@synthesize MainURL;
int temp=0;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)NextImage
{
    
    NSString *path=@"";
    //    if(temp==0)
    //    {
    //
    //        //img1.image=[UIImage imageNamed:@"http://itmeshop.com/img/1.jpg"];
    //
    //        path=@"http://itmeshop.com/img/1.jpg";
    //        temp=1;
    //    }
    //    else{
    //    //img1.image=[UIImage imageNamed:@"http://itmeshop.com/img/2.jpg"];
    //        path=@"http://itmeshop.com/img/2.jpg";
    //        temp=0;
    //    }
    temp++;
    
    //NSURL *url = [NSURL URLWithString:path];
    //NSData *data = [NSData dataWithContentsOfURL:url];
    //UIImage *img2= [[UIImage alloc] initWithData:data cache:NO];
    //img1.image=[img2.images objectAtIndex:0];
    path=@"http://itmeshop.com/img/";
    path=[path stringByAppendingString:[NSString stringWithFormat:@"%d",temp]];
    path=[path stringByAppendingString:@".jpg"];
    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:path]]];
    
    img1.image=image;
    //CGSize size = img.size;

}
-(IBAction)changeImage:(id)sender
{
    [self NextImage];
}
- (IBAction)nextSwipe:(UISwipeGestureRecognizer *)recognizer{
    
    if (recognizer.direction== UISwipeGestureRecognizerDirectionLeft) {
        NSLog(@"left");
    } else {
         [self NextImage];
         NSLog(@"right %d",recognizer.numberOfTouches);
    }
   

}
- (void)viewDidLoad
{
    [super viewDidLoad];
    img1.image=[UIImage imageNamed:@"1.jpg"];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
