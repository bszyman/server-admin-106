//
//  XgridViewController.m
//  Server Admin
//
//  Created by Ben Szymanski on 2/16/22.
//

#import "XgridViewController.h"
#import "../Views/ModuleGraphicalTabs.h"

@interface XgridViewController ()

@property (strong) ModuleGraphicalTabs *tabs;

@end

@implementation XgridViewController

- (instancetype)initWithNibName:(NSNibName)nibNameOrNil
                         bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil
                           bundle:nibBundleOrNil];
    
    if (self) {
        self.tabs = [[ModuleGraphicalTabs alloc] initWithFrame:NSMakeRect(0.0, (self.view.frame.size.height - 55.0), 687.0, 55.0)];
        
        [self.tabs addTabWithImageNamed:@"NSInfo" title:@"Overview"];
        [self.tabs addTabWithImageNamed:@"NSBonjour" title:@"Logs"];
        [self.tabs addTabWithImageNamed:@"NSAdvanced" title:@"Settings"];
        
        [self.view addSubview:self.tabs];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}

@end
