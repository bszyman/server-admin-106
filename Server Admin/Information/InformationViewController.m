//
//  InformationViewController.m
//  Server Admin
//
//  Created by Ben Szymanski on 2/16/22.
//

#import "InformationViewController.h"
#import "../Views/ModuleGraphicalTabs.h"
#import "InformationOverviewViewController.h"
#import "InformationLogsViewController.h"
#import "InformationGraphsViewController.h"
#import "InformationFileSharingViewController.h"
#import "InformationServerUpdatesViewController.h"
#import "InformationCertificatesViewController.h"
#import "InformationAccessViewController.h"
#import "InformationSettingsViewController.h"


@interface InformationViewController ()

@property (strong) ModuleGraphicalTabs *tabs;

@property (weak) IBOutlet NSView *panelView;
@property (strong) NSMutableDictionary *panels;
@property (strong) NSViewController *activePanel;

@end

@implementation InformationViewController

- (instancetype)initWithNibName:(NSNibName)nibNameOrNil
                         bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil
                           bundle:nibBundleOrNil];
    
    if (self) {
        self.tabs = [[ModuleGraphicalTabs alloc] initWithFrame:NSMakeRect(0.0, (self.view.frame.size.height - 55.0), 687.0, 55.0)];
        
        [self.tabs setNotificationName:@"InformationNavUpdate"];
        [self.tabs addTabWithImageNamed:@"NSInfo" title:@"Overview"];
        [self.tabs addTabWithImageNamed:@"NSBonjour" title:@"Logs"];
        [self.tabs addTabWithImageNamed:@"NSBonjour" title:@"Graphs"];
        [self.tabs addTabWithImageNamed:@"NSBonjour" title:@"File Sharing"];
        [self.tabs addTabWithImageNamed:@"NSBonjour" title:@"Server Updates"];
        [self.tabs addTabWithImageNamed:@"NSBonjour" title:@"Certificates"];
        [self.tabs addTabWithImageNamed:@"NSBonjour" title:@"Access"];
        [self.tabs addTabWithImageNamed:@"NSAdvanced" title:@"Settings"];
        
        [self.view addSubview:self.tabs];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(changeModuleSubnavigation:)
                                                     name:@"InformationNavUpdate"
                                                   object:self.tabs];
        
        NSViewController *vc = [[InformationOverviewViewController alloc] initWithNibName:@"InformationOverviewViewController"
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
    
    if ([tabTitle isEqualToString:@"Logs"]) {
        if ([self.panels objectForKey:@"logs"]) {
            NSViewController *vc = [self.panels objectForKey:@"logs"];
            [self.panelView addSubview:vc.view];
        } else {
            NSViewController *vc = [[InformationLogsViewController alloc] initWithNibName:@"InformationLogsViewController"
                                                                                       bundle:[NSBundle mainBundle]];
            [self.panels setObject:vc forKey:@"logs"];
            [self.panelView addSubview:vc.view];
        }
    } else if ([tabTitle isEqualToString:@"Graphs"]) {
        if ([self.panels objectForKey:@"graphs"]) {
            NSViewController *vc = [self.panels objectForKey:@"graphs"];
            [self.panelView addSubview:vc.view];
        } else {
            NSViewController *vc = [[InformationGraphsViewController alloc] initWithNibName:@"InformationGraphsViewController"
                                                                                       bundle:[NSBundle mainBundle]];
            [self.panels setObject:vc forKey:@"graphs"];
            [self.panelView addSubview:vc.view];
        }
    } else if ([tabTitle isEqualToString:@"File Sharing"]) {
        if ([self.panels objectForKey:@"filesharing"]) {
            NSViewController *vc = [self.panels objectForKey:@"filesharing"];
            [self.panelView addSubview:vc.view];
        } else {
            NSViewController *vc = [[InformationFileSharingViewController alloc] initWithNibName:@"InformationFileSharingViewController"
                                                                                       bundle:[NSBundle mainBundle]];
            [self.panels setObject:vc forKey:@"filesharing"];
            [self.panelView addSubview:vc.view];
        }
    } else if ([tabTitle isEqualToString:@"Server Updates"]) {
        if ([self.panels objectForKey:@"serverupdates"]) {
            NSViewController *vc = [self.panels objectForKey:@"serverupdates"];
            [self.panelView addSubview:vc.view];
        } else {
            NSViewController *vc = [[InformationServerUpdatesViewController alloc] initWithNibName:@"InformationServerUpdatesViewController"
                                                                                       bundle:[NSBundle mainBundle]];
            [self.panels setObject:vc forKey:@"serverupdates"];
            [self.panelView addSubview:vc.view];
        }
    } else if ([tabTitle isEqualToString:@"Certificates"]) {
        if ([self.panels objectForKey:@"certificates"]) {
            NSViewController *vc = [self.panels objectForKey:@"certificates"];
            [self.panelView addSubview:vc.view];
        } else {
            NSViewController *vc = [[InformationCertificatesViewController alloc] initWithNibName:@"InformationCertificatesViewController"
                                                                                       bundle:[NSBundle mainBundle]];
            [self.panels setObject:vc forKey:@"certificates"];
            [self.panelView addSubview:vc.view];
        }
    } else if ([tabTitle isEqualToString:@"Access"]) {
        if ([self.panels objectForKey:@"access"]) {
            NSViewController *vc = [self.panels objectForKey:@"access"];
            [self.panelView addSubview:vc.view];
        } else {
            NSViewController *vc = [[InformationAccessViewController alloc] initWithNibName:@"InformationAccessViewController"
                                                                                       bundle:[NSBundle mainBundle]];
            [self.panels setObject:vc forKey:@"access"];
            [self.panelView addSubview:vc.view];
        }
    } else if ([tabTitle isEqualToString:@"Settings"]) {
        if ([self.panels objectForKey:@"settings"]) {
            NSViewController *vc = [self.panels objectForKey:@"settings"];
            [self.panelView addSubview:vc.view];
        } else {
            NSViewController *vc = [[InformationSettingsViewController alloc] initWithNibName:@"InformationSettingsViewController"
                                                                                       bundle:[NSBundle mainBundle]];
            [self.panels setObject:vc forKey:@"settings"];
            [self.panelView addSubview:vc.view];
        }
    } else {
        if ([self.panels objectForKey:@"overview"]) {
            NSViewController *vc = [self.panels objectForKey:@"overview"];
            [self.panelView addSubview:vc.view];
        } else {
            NSViewController *vc = [[InformationOverviewViewController alloc] initWithNibName:@"InformationOverviewViewController"
                                                                                       bundle:[NSBundle mainBundle]];
            [self.panels setObject:vc forKey:@"overview"];
            [self.panelView addSubview:vc.view];
        }
    }
}

@end
