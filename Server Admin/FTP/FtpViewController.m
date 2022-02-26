//
//  FtpViewController.m
//  Server Admin
//
//  Created by Ben Szymanski on 2/16/22.
//

#import "FtpViewController.h"
#import "../Views/ModuleGraphicalTabs.h"
#import "FtpOverviewViewController.h"
#import "FtpLogViewController.h"
#import "FtpGraphsViewController.h"
#import "FtpConnectionsViewController.h"
#import "FtpSharePointsViewController.h"
#import "FtpSettingsViewController.h"


@interface FtpViewController ()

@property (strong) ModuleGraphicalTabs *tabs;
@property (weak) IBOutlet NSView *panelView;
@property (strong) NSMutableDictionary *panels;
@property (strong) NSViewController *activePanel;

@end

@implementation FtpViewController

- (instancetype)initWithNibName:(NSNibName)nibNameOrNil
                         bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil
                           bundle:nibBundleOrNil];
    
    if (self) {
        self.tabs = [[ModuleGraphicalTabs alloc] initWithFrame:NSMakeRect(0.0, (self.view.frame.size.height - 55.0), 687.0, 55.0)];
        
        [self.tabs setNotificationName:@"FtpNavUpdate"];
        [self.tabs addTabWithImageNamed:@"NSInfo" title:@"Overview"];
        [self.tabs addTabWithImageNamed:@"NSBonjour" title:@"Log"];
        [self.tabs addTabWithImageNamed:@"NSBonjour" title:@"Graphs"];
        [self.tabs addTabWithImageNamed:@"NSBonjour" title:@"Connections"];
        [self.tabs addTabWithImageNamed:@"NSBonjour" title:@"Share Points"];
        [self.tabs addTabWithImageNamed:@"NSAdvanced" title:@"Settings"];
        
        [self.view addSubview:self.tabs];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(changeModuleSubnavigation:)
                                                     name:@"FtpNavUpdate"
                                                   object:self.tabs];
        
        NSViewController *vc = [[FtpOverviewViewController alloc] initWithNibName:@"FtpOverviewViewController"
                                                                           bundle:[NSBundle mainBundle]];
        
        [self setActivePanel:vc];
        [self.panels setObject:vc forKey:@"overview"];
        
        [self.panelView addSubview:vc.view];
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do view setup here.
}

- (void)clearAllSubviews
{
    NSArray *subviews = self.panelView.subviews;
    for (NSView *subview in subviews) {
        [subview removeFromSuperview];
    }
}

- (void)changeModuleSubnavigation:(NSNotification *)n
{
    NSString *tabTitle = [n.userInfo objectForKey:@"tabTitle"];
    
    [self clearAllSubviews];
    
    if ([tabTitle isEqualToString:@"Log"]) {
        if ([self.panels objectForKey:@"log"]) {
            NSViewController *vc = [self.panels objectForKey:@"log"];
            [self.panelView addSubview:vc.view];
        } else {
            NSViewController *vc = [[FtpLogViewController alloc] initWithNibName:@"FtpLogViewController"
                                                                                       bundle:[NSBundle mainBundle]];
            [self.panels setObject:vc forKey:@"log"];
            [self.panelView addSubview:vc.view];
        }
    } else if ([tabTitle isEqualToString:@"Graphs"]) {
        if ([self.panels objectForKey:@"graphs"]) {
            NSViewController *vc = [self.panels objectForKey:@"graphs"];
            [self.panelView addSubview:vc.view];
        } else {
            NSViewController *vc = [[FtpGraphsViewController alloc] initWithNibName:@"FtpGraphsViewController"
                                                                                       bundle:[NSBundle mainBundle]];
            [self.panels setObject:vc forKey:@"graphs"];
            [self.panelView addSubview:vc.view];
        }
    } else if ([tabTitle isEqualToString:@"Connections"]) {
        if ([self.panels objectForKey:@"connections"]) {
            NSViewController *vc = [self.panels objectForKey:@"connections"];
            [self.panelView addSubview:vc.view];
        } else {
            NSViewController *vc = [[FtpConnectionsViewController alloc] initWithNibName:@"FtpConnectionsViewController"
                                                                                       bundle:[NSBundle mainBundle]];
            [self.panels setObject:vc forKey:@"connections"];
            [self.panelView addSubview:vc.view];
        }
    } else if ([tabTitle isEqualToString:@"Share Points"]) {
        if ([self.panels objectForKey:@"sharepoints"]) {
            NSViewController *vc = [self.panels objectForKey:@"sharepoints"];
            [self.panelView addSubview:vc.view];
        } else {
            NSViewController *vc = [[FtpSharePointsViewController alloc] initWithNibName:@"FtpSharePointsViewController"
                                                                                       bundle:[NSBundle mainBundle]];
            [self.panels setObject:vc forKey:@"sharepoints"];
            [self.panelView addSubview:vc.view];
        }
    } else if ([tabTitle isEqualToString:@"Settings"]) {
        if ([self.panels objectForKey:@"settings"]) {
            NSViewController *vc = [self.panels objectForKey:@"settings"];
            [self.panelView addSubview:vc.view];
        } else {
            NSViewController *vc = [[FtpSettingsViewController alloc] initWithNibName:@"FtpSettingsViewController"
                                                                                       bundle:[NSBundle mainBundle]];
            [self.panels setObject:vc forKey:@"settings"];
            [self.panelView addSubview:vc.view];
        }
    } else {
        if ([self.panels objectForKey:@"overview"]) {
            NSViewController *vc = [self.panels objectForKey:@"overview"];
            [self.panelView addSubview:vc.view];
        } else {
            NSViewController *vc = [[FtpOverviewViewController alloc] initWithNibName:@"FtpOverviewViewController"
                                                                                       bundle:[NSBundle mainBundle]];
            [self.panels setObject:vc forKey:@"overview"];
            [self.panelView addSubview:vc.view];
        }
    }
}


@end
