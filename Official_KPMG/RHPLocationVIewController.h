//
//  RHPLocationVIewController.h
//  KPMG
//
//  Created by Richard Phillips on 12/8/14.
//  Copyright (c) 2014 Richard Phillips. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GoogleMaps/GoogleMaps.h>

@interface RHPLocationViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate> {
    
}

@property (weak, nonatomic) IBOutlet GMSMapView *mapView;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (strong, nonatomic) NSMutableArray *arrayPickerView;
@property (strong, nonatomic) NSString *currentCity;
@property (strong, nonatomic) GMSMarker *marker;

@end
