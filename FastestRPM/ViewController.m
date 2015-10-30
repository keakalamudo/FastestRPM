//
//  ViewController.m
//  FastestRPM
//
//  Created by Kelo Akalamudo on 10/29/15.
//  Copyright © 2015 Kelo. All rights reserved.
//

#import "ViewController.h"
#define DEGREES_TO_RADIANS(angle) (angle / 180.0 * M_PI)

@interface ViewController (){
    CGPoint initialLocation;
    CGPoint endLocation;
}
@property (weak, nonatomic) IBOutlet UIImageView *speedoImage;
@property (weak, nonatomic) IBOutlet UIImageView *needleImage;
@property (strong, nonatomic) IBOutlet UIPanGestureRecognizer *recognizer;

@property NSUInteger velocity;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self rotateImage:_needleImage degrees:-225];
    [self.view addSubview:_needleImage ];
    
    
    


    
    
}
- (IBAction)screenTouched:(id)sender {
//    CGPoint currentlocation = [_recognizer locationInView:self.view];
//    
//    CGPoint previousLocation = [_recognizer locationInView:self.view];
    switch (_recognizer.state) {
        case UIGestureRecognizerStateChanged:{
             initialLocation = [_recognizer locationInView:self.view];
            break;
        }
        case UIGestureRecognizerStateEnded:{
             endLocation = [_recognizer locationInView:self.view];
            CGFloat xDist = (endLocation.x - initialLocation.x);
            CGFloat yDist = (initialLocation.y - initialLocation.y);
            CGFloat distance = sqrt((xDist * xDist) + (yDist * yDist));
            [self rotateImage:_needleImage degrees:distance];
            
            
             [NSTimer scheduledTimerWithTimeInterval:2.5 target:self selector:@selector(resetNeedle:) userInfo:nil repeats:YES];

        }
        default:
            break;
    }



}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) rotateImage:(UIImageView *) imageView degrees:(CGFloat) degrees
{
    CGAffineTransform transform = CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(degrees));
    imageView.transform = transform;
}

- (void)resetNeedle:(NSTimer *)sender {
    [self rotateImage:_needleImage degrees:-225];

}

@end
