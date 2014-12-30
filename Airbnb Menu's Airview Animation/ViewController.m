//
//  ViewController.m
//  Airbnb Menu's Airview Animation
//
//  Created by Ahmed Abd Elmeguid on 12/30/14.
//  Copyright (c) 2014 Cocoa Ninja. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UIView *CNview;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    CNview=[[UIView alloc]initWithFrame:self.view.frame];
    UIImageView *CNimageview = [[UIImageView alloc]initWithFrame:CNview.frame];
    CNimageview.image=[UIImage imageNamed:@"CNimage.jpg"];
    [CNview addSubview:CNimageview];
    [self.view addSubview:CNview];

    
    //Start Animation
    [self airviewAnimate];
    
    
    //Reverse Animation
    // [self airviewBack];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)airviewAnimate {
    

    [UIView animateWithDuration:0.5
                          delay:0.0
                        options:(UIViewAnimationCurveEaseInOut|UIViewAnimationOptionAllowUserInteraction )
                     animations:^{
                         [UIView setAnimationDelegate:self];
                         
                         CALayer *layer = CNview.layer;
                         CATransform3D transform1 = CATransform3DMakeScale(.5, .5, 1);
                         CATransform3D transform2 = CATransform3DIdentity;
                         transform2.m34 = -1.0 / 700.0;
                         transform2 = CATransform3DRotate(transform2, -1, 0, 1, 0);
                         layer.transform = CATransform3DConcat(transform1, transform2);
                         
                         CGRect frame = CNview.frame;
                         frame.origin.x = 280.0f;
                         frame.origin.y = 60.0f;
                         CNview.frame = frame;
                         
                         
                     }
                     completion:^(BOOL finished){
                         
                     }];
}


- (void)airviewBack{
    
    [UIView animateWithDuration:0.5
                          delay:0.0
                        options:(UIViewAnimationCurveEaseInOut|UIViewAnimationOptionAllowUserInteraction )
                     animations:^{
                         [UIView setAnimationDelegate:self];
                         CNview.frame = self.view.frame;
                         CALayer *layer = CNview.layer;
                         CATransform3D transform2 = CATransform3DIdentity;
                         transform2.m34 =  1.0 / 700.0;
                         transform2 = CATransform3DRotate(transform2, 1, 0, 0, 0);
                         layer.transform = transform2;
                     }
                     completion:^(BOOL finished){
                         
                     }];
    
}

@end
