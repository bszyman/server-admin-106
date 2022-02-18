//
//  AppDelegate.m
//  Server Admin
//
//  Created by Ben Szymanski on 2/15/22.
//

#import "AppDelegate.h"
#import "Models/ServerModel.h"
#import "Models/ServiceNavigationItem.h"
#import "Information/InformationViewController.h"
#import "AddressBook/AddressBookViewController.h"
#import "AFP/AfpViewController.h"
#import "DHCP/DhcpViewController.h"
#import "DNS/DnsViewController.h"
#import "Firewall/FirewallViewController.h"
#import "FTP/FtpViewController.h"
#import "iCal/iCalViewController.h"
#import "iChat/iChatViewController.h"
#import "Mail/MailViewController.h"
#import "MobileAccess/MobileAccessViewController.h"
#import "MySQL/MySqlViewController.h"
#import "NAT/NatViewController.h"
#import "NetBoot/NetBootViewController.h"
#import "NFS/NfsViewController.h"
#import "OpenDirectory/OpenDirectoryViewController.h"
#import "PodcastProducer/PodcastProducerViewController.h"
#import "Print/PrintViewController.h"
#import "PushNotification/PushNotificationViewController.h"
#import "QuickTimeStreaming/QuickTimeStreamingViewController.h"
#import "RADIUS/RadiusViewController.h"
#import "SMB/SmbViewController.h"
#import "SoftwareUpdate/SoftwareUpdateViewController.h"
#import "VPN/VpnViewController.h"
#import "Web/WebViewController.h"
#import "Xgrid/XgridViewController.h"

@interface AppDelegate ()

@property (strong) IBOutlet NSWindow *window;

@property (strong) ServerModel *testServer;
@property (strong) NSArray *servers;
@property (strong) NSMutableDictionary *servicePanels;

@property (weak) IBOutlet NSView *servicePanelDetailView;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    self.servicePanels = [[NSMutableDictionary alloc] init];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(changeTopLevelNavigation:)
                                                 name:@"changedNavigation"
                                               object:nil];
    
    self.testServer = [[ServerModel alloc] init];
    self.testServer.serverName = @"cocos.local";

    NSTreeNode *cocosServer = [self.testServer sourceListStructure];
    
    self.servers = @[cocosServer];
}


- (void)applicationWillTerminate:(NSNotification *)aNotification
{
    // Insert code here to tear down your application
}


- (BOOL)applicationSupportsSecureRestorableState:(NSApplication *)app
{
    return YES;
}

#pragma mark - Top-Level Navigation

- (void)clearAllSubviews
{
    NSArray *subviews = self.servicePanelDetailView.subviews;
    for (NSView *subview in subviews) {
        [subview removeFromSuperview];
    }
}

- (void)changeTopLevelNavigation:(NSNotification *)notification
{
    ServiceNavigationItem *selectedNavigation = (ServiceNavigationItem *)[notification.userInfo objectForKey:@"navigationItem"];
    
    NSString *viewCode = [NSString stringWithFormat:@"%@-%@", selectedNavigation.serverHost, selectedNavigation.serviceId];
    
    if ([self.servicePanels objectForKey:viewCode]) {
        NSViewController *vc = [self.servicePanels objectForKey:viewCode];
        
        [self clearAllSubviews];
        [self.servicePanelDetailView addSubview:vc.view];
    } else {
        [self clearAllSubviews];
        
        NSViewController *vc;
        NSString *sid = selectedNavigation.serviceId;
        
        if ([sid isEqualToString:@"address-book"]) {
            vc = [[AddressBookViewController alloc] initWithNibName:@"AddressBookViewController" bundle:NSBundle.mainBundle];
        } else if ([sid isEqualToString:@"afp"]) {
            vc = [[AfpViewController alloc] initWithNibName:@"AfpViewController" bundle:NSBundle.mainBundle];
        } else if ([sid isEqualToString:@"dhcp"]) {
            vc = [[DhcpViewController alloc] initWithNibName:@"DhcpViewController" bundle:NSBundle.mainBundle];
        } else if ([sid isEqualToString:@"dns"]) {
            vc = [[DnsViewController alloc] initWithNibName:@"DnsViewController" bundle:NSBundle.mainBundle];
        } else if ([sid isEqualToString:@"firewall"]) {
            vc = [[FirewallViewController alloc] initWithNibName:@"FirewallViewController" bundle:NSBundle.mainBundle];
        } else if ([sid isEqualToString:@"ftp"]) {
            vc = [[FtpViewController alloc] initWithNibName:@"FtpViewController" bundle:NSBundle.mainBundle];
        } else if ([sid isEqualToString:@"ical"]) {
            vc = [[iCalViewController alloc] initWithNibName:@"iCalViewController" bundle:NSBundle.mainBundle];
        } else if ([sid isEqualToString:@"ichat"]) {
            vc = [[iChatViewController alloc] initWithNibName:@"iChatViewController" bundle:NSBundle.mainBundle];
        } else if ([sid isEqualToString:@"mail"]) {
            vc = [[MailViewController alloc] initWithNibName:@"MailViewController" bundle:NSBundle.mainBundle];
        } else if ([sid isEqualToString:@"mobile-access"]) {
            vc = [[MobileAccessViewController alloc] initWithNibName:@"MobileAccessViewController" bundle:NSBundle.mainBundle];
        } else if ([sid isEqualToString:@"mysql"]) {
            vc = [[MySqlViewController alloc] initWithNibName:@"MySqlViewController" bundle:NSBundle.mainBundle];
        } else if ([sid isEqualToString:@"nat"]) {
            vc = [[NatViewController alloc] initWithNibName:@"NatViewController" bundle:NSBundle.mainBundle];
        } else if ([sid isEqualToString:@"netboot"]) {
            vc = [[NetBootViewController alloc] initWithNibName:@"NetBootViewController" bundle:NSBundle.mainBundle];
        } else if ([sid isEqualToString:@"nfs"]) {
            vc = [[NfsViewController alloc] initWithNibName:@"NfsViewController" bundle:NSBundle.mainBundle];
        } else if ([sid isEqualToString:@"opendirectory"]) {
            vc = [[OpenDirectoryViewController alloc] initWithNibName:@"OpenDirectoryViewController" bundle:NSBundle.mainBundle];
        } else if ([sid isEqualToString:@"podcast-producer"]) {
            vc = [[PodcastProducerViewController alloc] initWithNibName:@"PodcastProducerViewController" bundle:NSBundle.mainBundle];
        } else if ([sid isEqualToString:@"print"]) {
            vc = [[PrintViewController alloc] initWithNibName:@"PrintViewController" bundle:NSBundle.mainBundle];
        }else if ([sid isEqualToString:@"push-notification"]) {
            vc = [[PushNotificationViewController alloc] initWithNibName:@"PushNotificationViewController" bundle:NSBundle.mainBundle];
        } else if ([sid isEqualToString:@"quicktime-streaming"]) {
            vc = [[QuickTimeStreamingViewController alloc] initWithNibName:@"QuickTimeStreamingViewController" bundle:NSBundle.mainBundle];
        } else if ([sid isEqualToString:@"radius"]) {
            vc = [[RadiusViewController alloc] initWithNibName:@"RadiusViewController" bundle:NSBundle.mainBundle];
        } else if ([sid isEqualToString:@"smb"]) {
            vc = [[SmbViewController alloc] initWithNibName:@"SmbViewController" bundle:NSBundle.mainBundle];
        } else if ([sid isEqualToString:@"software-update"]) {
            vc = [[SoftwareUpdateViewController alloc] initWithNibName:@"SoftwareUpdateViewController" bundle:NSBundle.mainBundle];
        } else if ([sid isEqualToString:@"vpn"]) {
            vc = [[VpnViewController alloc] initWithNibName:@"VpnViewController" bundle:NSBundle.mainBundle];
        }  else if ([sid isEqualToString:@"web"]) {
            vc = [[WebViewController alloc] initWithNibName:@"WebViewController" bundle:NSBundle.mainBundle];
        } else if ([sid isEqualToString:@"xgrid"]) {
           vc = [[XgridViewController alloc] initWithNibName:@"XgridViewController" bundle:NSBundle.mainBundle];
        } else {
            vc = [[InformationViewController alloc] initWithNibName:@"InformationViewController" bundle:NSBundle.mainBundle];
        }
        
        [self.servicePanelDetailView addSubview:vc.view];
        [self.servicePanels setObject:vc forKey:viewCode];
    }
}


@end
