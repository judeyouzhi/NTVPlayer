//
//  ViewController.m
//  TestAVPlayer
//
//  Created by Mike on 2014-05-07.
//  Copyright (c) 2014 Mike. All rights reserved.
//

#import "ViewController.h"
#import "KSVideoPlayerView.h"

@interface ViewController ()

@property (strong, nonatomic) KSVideoPlayerView* player;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
//    self.player = [[KSVideoPlayerView alloc] initWithFrame:CGRectMake(0, 20, 320, 180) contentURL:[NSURL URLWithString:@"http://219.232.160.141:5080/hls/c64024e7cd451ac19613345704f985fa.m3u8"]];
    self.player = [[KSVideoPlayerView alloc] initWithFrame:CGRectMake(0, 20, 320, 180) contentURL:[NSURL URLWithString:@"http://192.168.1.160/vod/pva/bhmaaa/cell.m3u8"]];
    [self.view addSubview:self.player];
    self.player.tintColor = [UIColor redColor];
    [self.player play];
    [self.player setDelegate:self];
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    
    [UIView animateWithDuration:duration animations:^{
        if(UIDeviceOrientationIsLandscape(toInterfaceOrientation)) {
            self.player.frame = CGRectMake(0, 0, self.view.frame.size.height, self.view.frame.size.width);
        } else {
            self.player.frame = CGRectMake(0, 20, 320, 180);
        }
    } completion:^(BOOL finished) {
        
    }];
}

-(void)viewDidLayoutSubviews
{
    NSLog(@"layout subviews called");
    int width = self.view.frame.size.width;
    int height = self.view.frame.size.height;
    
    NSLog(@"%d x %d",width, height);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark playerViewDelegate

-(void)playerViewZoomButtonClicked:(KSVideoPlayerView*)view
{
    
    if (self.player.isFullScreenMode) {
        //[self performOrientationChange:UIInterfaceOrientationLandscapeRight];
        NSLog(@"playerViewZoomButtonClicked: isFullScreenMode");
    } else {
        //[self performOrientationChange:UIInterfaceOrientationPortrait];
        NSLog(@"playerViewZoomButtonClicked");
    }
}

-(void)playerFinishedPlayback:(KSVideoPlayerView*)view
{
    NSLog(@"playerFinishedPlayback");
}

#pragma mark -Orientation

//- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
//    if (self.player.isFullScreenMode) {
//        return UIInterfaceOrientationIsLandscape(interfaceOrientation);
//    } else {
//        return NO;
//    }
//}
//
//- (NSUInteger)supportedInterfaceOrientations {
//    return UIInterfaceOrientationMaskLandscapeRight;
//}
@end
