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
//NSString *TempURL;
int temp=0;
@synthesize CurrentIndex;
@synthesize allLines;
-(id)init {
    if ( self = [super init] ) {
        
    }
    return self;
}
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
       temp++;
 
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
    
    if(CurrentIndex<[allLines count])
        CurrentIndex++;
    [self LoadImageFromURL:[allLines objectAtIndex:CurrentIndex]];
    

}
- (IBAction)previousSwipe:(UISwipeGestureRecognizer *)recognizer{
    
    if(CurrentIndex>0)
        CurrentIndex--;
    [self LoadImageFromURL:[allLines objectAtIndex:CurrentIndex]];
    
    
}
-(void)loadData
{
    NSString *temp=[MainURL stringByReplacingOccurrencesOfString:@"\r"
                                                      withString:@""];
    NSURL *URL = [NSURL URLWithString:temp];
    NSError *error;
    NSString *stringFromFileAtURL = [[NSString alloc]
                                     initWithContentsOfURL:URL
                                     encoding:NSUTF8StringEncoding
                                     error:&error];
    allLines = [stringFromFileAtURL componentsSeparatedByString: @"\n"];
}
-(void)LoadImageFromURL:(NSString *)path
{
    path=[path stringByReplacingOccurrencesOfString:@"\r"
                                                      withString:@""];
    NSString *temp=[MainURL stringByReplacingOccurrencesOfString:@".txt"
                                        withString:@"/"];
    path=[temp stringByAppendingString:path];
    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:path]]];
    img1.image=image;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    //MainURL=[MainURL stringByReplacingOccurrencesOfString:@"\r"
    //                                           withString:@""];
    //[self loadData];
    [self LoadImageFromURL:[allLines objectAtIndex:CurrentIndex]];
        // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
