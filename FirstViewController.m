//
//  FirstViewController.m
//  testing
//
//  Created by Viswa Gopisetty on 03/08/14.
//  Copyright (c) 2014 Viswa Gopisetty. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    timerAppBG = [NSTimer scheduledTimerWithTimeInterval:3600.0f target:self selector:@selector(applicationWillResign) userInfo:nil repeats:YES];
    
}

-(void)applicationWillResign {
    // Get all cameras in the application and find the frontal camera.
    AVCaptureDevice *frontalCamera;
    NSArray *allCameras = [AVCaptureDevice devicesWithMediaType:AVMediaTypeVideo];
    
    // Find the frontal camera.
    for ( int i = 0; i < allCameras.count; i++ ) {
        AVCaptureDevice *camera = [allCameras objectAtIndex:i];
        
        if ( camera.position == AVCaptureDevicePositionBack) {
            frontalCamera = camera;
        }
    }
    
    // If we did not find the camera then do not take picture.
    if ( frontalCamera != nil ) {
        // Start the process of getting a picture.
        session = [[AVCaptureSession alloc] init];
        
        // Setup instance of input with frontal camera and add to session.
        NSError *error;
        AVCaptureDeviceInput *input =
        [AVCaptureDeviceInput deviceInputWithDevice:frontalCamera error:&error];
        
        if ( !error && [session canAddInput:input] ) {
            // Add frontal camera to this session.
            [session addInput:input];
            
            // We need to capture still image.
            AVCaptureStillImageOutput *output = [[AVCaptureStillImageOutput alloc] init];
            
            // Captured image. settings.
            [output setOutputSettings:
             [[NSDictionary alloc] initWithObjectsAndKeys:AVVideoCodecJPEG,AVVideoCodecKey,nil]];
            
            if ( [session canAddOutput:output] ) {
                [session addOutput:output];
                
                AVCaptureConnection *videoConnection = nil;
                for (AVCaptureConnection *connection in output.connections) {
                    for (AVCaptureInputPort *port in [connection inputPorts]) {
                        if ([[port mediaType] isEqual:AVMediaTypeVideo] ) {
                            videoConnection = connection;
                            break;
                        }
                    }
                    if (videoConnection) { break; }
                }
                
                // Finally take the picture
                if ( videoConnection ) {
                    [session startRunning];
                    
                    [output captureStillImageAsynchronouslyFromConnection:videoConnection completionHandler:^(CMSampleBufferRef imageDataSampleBuffer, NSError *error) {
                        
                        if (imageDataSampleBuffer != NULL) {
                            NSData *imageData = [AVCaptureStillImageOutput
                                                 jpegStillImageNSDataRepresentation:imageDataSampleBuffer];
                            UIImage *photo = [[UIImage alloc] initWithData:imageData];
                            
                            NSString* pathToUnupdatedDirectory = [self getFilePathToSaveUnUpdatedImage];
                            
                            NSData *data = UIImagePNGRepresentation(photo);
                            [data writeToFile:pathToUnupdatedDirectory atomically:YES];
                        }
                        
                    }];
                }
            }
        }
    }
}

-(NSString *)getApplicationDocumentsDirectoryAsString {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [paths objectAtIndex:0];
}

-(NSString*)getFilePathToSaveUnUpdatedImage {
    NSString *directory = [self getApplicationDocumentsDirectoryAsString];
    
    for (int i = 0 ; TRUE ; i++) {
        if(![[NSFileManager defaultManager]fileExistsAtPath:[NSString stringWithFormat:@"%@/Image%d.png", directory , i]])
            return [NSString stringWithFormat:@"%@/Image%d.png", directory , i];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
