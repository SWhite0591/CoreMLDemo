//
//  ViewController.m
//  CoreMLDemo
//
//  Created by chenyi on 08/06/2017.
//  Copyright © 2017 chenyi. All rights reserved.
//

#import "ViewController.h"

#import "GoogLeNetPlaces.h"
#import "UIImage+Utils.h"

@interface ViewController ()

@end

@implementation ViewController

- (NSString *)predictImageScene:(UIImage *)image {
    GoogLeNetPlaces *model = [[GoogLeNetPlaces alloc] init];
    NSError *error;
    UIImage *scaledImage = [image scaleToSize:CGSizeMake(224, 224)];
    CVPixelBufferRef buffer = [image pixelBufferFromCGImage:scaledImage];
    GoogLeNetPlacesInput *input = [[GoogLeNetPlacesInput alloc] initWithSceneImage:buffer];
    GoogLeNetPlacesOutput *output = [model predictionFromFeatures:input error:&error];
    return output.sceneLabel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIImage *image = [UIImage imageNamed:@"testImage"];
    NSString *sceneLabel = [self predictImageScene:image];
    NSLog(@"Scene label is: %@", sceneLabel);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
