//
//  ServerModel.m
//  Server Admin
//
//  Created by Ben Szymanski on 2/15/22.
//

#import "ServerModel.h"

@implementation ServerModel

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        self.serverName = @"New Server";

        self.addressBookEnabled = YES;
        self.afpEnabled = YES;
        self.dhcpEnabled = YES;
        self.dnsEnabled = YES;
        self.firewallEnabled = YES;
        self.ftpEnabled = YES;
        self.iCalEnabled = YES;
        self.iChatEnabled = YES;
        self.mailEnabled = YES;
        self.mobileAccessEnabled = YES;
        self.mySqlEnabled = YES;
        self.natEnabled = YES;
        self.netBootEnabled = YES;
        self.nfsEnabled = YES;
        self.openDirectoryEnabled = YES;
        self.podcastProducerEnabled = YES;
        self.printEnabled = YES;
        self.pushNotificationEnabled = YES;
        self.quickTimeStreamingEnabled = YES;
        self.radiusEnabled = YES;
        self.smbEnabled = YES;
        self.softwareUpdateEnabled = YES;
        self.vpnEnabled = YES;
        self.webEnabled = YES;
        self.xgridEnabled = YES;
    }
    
    return self;
}

- (NSTreeNode *)sourceListStructure
{
    NSTreeNode *serverNode = [NSTreeNode treeNodeWithRepresentedObject:@{
        @"title": self.serverName,
        @"key": @"server-node"
    }];
    
    if (self.addressBookEnabled) {
        NSTreeNode *addressBookNode = [NSTreeNode treeNodeWithRepresentedObject:@{
            @"title": @"Address Book",
            @"key": @"address-book"
        }];
        
        [serverNode.mutableChildNodes addObject:addressBookNode];
    }
    
    if (self.afpEnabled) {
        NSTreeNode *afpNode = [NSTreeNode treeNodeWithRepresentedObject:@{
            @"title": @"AFP",
            @"key": @"afp"
        }];
        
        [serverNode.mutableChildNodes addObject:afpNode];
    }
    
    if (self.dhcpEnabled) {
        NSTreeNode *dhcpNode = [NSTreeNode treeNodeWithRepresentedObject:@{
            @"title": @"DHCP",
            @"key": @"dhcp"
        }];
        
        [serverNode.mutableChildNodes addObject:dhcpNode];
    }
    
    if (self.dnsEnabled) {
        NSTreeNode *dnsNode = [NSTreeNode treeNodeWithRepresentedObject:@{
            @"title": @"DNS",
            @"key": @"dns"
        }];
        
        [serverNode.mutableChildNodes addObject:dnsNode];
    }
    
    if (self.firewallEnabled) {
        NSTreeNode *firewallNode = [NSTreeNode treeNodeWithRepresentedObject:@{
            @"title": @"Firewall",
            @"key": @"firewall"
        }];
        
        [serverNode.mutableChildNodes addObject:firewallNode];
    }
    
    if (self.ftpEnabled) {
        NSTreeNode *ftpNode = [NSTreeNode treeNodeWithRepresentedObject:@{
            @"title": @"FTP",
            @"key": @"ftp"
        }];
        
        [serverNode.mutableChildNodes addObject:ftpNode];
    }
    
    if (self.iCalEnabled) {
        NSTreeNode *iCalNode = [NSTreeNode treeNodeWithRepresentedObject:@{
            @"title": @"iCal",
            @"key": @"ical"
        }];
        
        [serverNode.mutableChildNodes addObject:iCalNode];
    }
    
    if (self.iChatEnabled) {
        NSTreeNode *iChatNode = [NSTreeNode treeNodeWithRepresentedObject:@{
            @"title": @"iChat",
            @"key": @"ichat"
        }];
        
        [serverNode.mutableChildNodes addObject:iChatNode];
    }
    
    if (self.mailEnabled) {
        NSTreeNode *mailNode = [NSTreeNode treeNodeWithRepresentedObject:@{
            @"title": @"Mail",
            @"key": @"mail"
        }];
        
        [serverNode.mutableChildNodes addObject:mailNode];
    }
    
    if (self.mobileAccessEnabled) {
        NSTreeNode *mobileAccessNode = [NSTreeNode treeNodeWithRepresentedObject:@{
            @"title": @"Mobile Access",
            @"key": @"mobile-access"
        }];
        
        [serverNode.mutableChildNodes addObject:mobileAccessNode];
    }
    
    if (self.mySqlEnabled) {
        NSTreeNode *mySqlNode = [NSTreeNode treeNodeWithRepresentedObject:@{
            @"title": @"MySQL",
            @"key": @"mysql"
        }];
        
        [serverNode.mutableChildNodes addObject:mySqlNode];
    }
    
    if (self.natEnabled) {
        NSTreeNode *natNode = [NSTreeNode treeNodeWithRepresentedObject:@{
            @"title": @"NAT",
            @"key": @"nat"
        }];
        
        [serverNode.mutableChildNodes addObject:natNode];
    }
    
    if (self.netBootEnabled) {
        NSTreeNode *netBootNode = [NSTreeNode treeNodeWithRepresentedObject:@{
            @"title": @"NetBoot",
            @"key": @"netboot"
        }];
        
        [serverNode.mutableChildNodes addObject:netBootNode];
    }
    
    if (self.nfsEnabled) {
        NSTreeNode *nfsNode = [NSTreeNode treeNodeWithRepresentedObject:@{
            @"title": @"NFS",
            @"key": @"nfs"
        }];
        
        [serverNode.mutableChildNodes addObject:nfsNode];
    }
    
    if (self.openDirectoryEnabled) {
        NSTreeNode *openDirectoryNode = [NSTreeNode treeNodeWithRepresentedObject:@{
            @"title": @"OpenDirectory",
            @"key": @"open-directory"
        }];
        
        [serverNode.mutableChildNodes addObject:openDirectoryNode];
    }
    
    if (self.podcastProducerEnabled) {
        NSTreeNode *podcastProducerNode = [NSTreeNode treeNodeWithRepresentedObject:@{
            @"title": @"Podcast Producer",
            @"key": @"podcast-producer"
        }];
        
        [serverNode.mutableChildNodes addObject:podcastProducerNode];
    }
    
    if (self.printEnabled) {
        NSTreeNode *printNode = [NSTreeNode treeNodeWithRepresentedObject:@{
            @"title": @"Print",
            @"key": @"print"
        }];
        
        [serverNode.mutableChildNodes addObject:printNode];
    }
    
    if (self.pushNotificationEnabled) {
        NSTreeNode *pushNotificationNode = [NSTreeNode treeNodeWithRepresentedObject:@{
            @"title": @"Push Notification",
            @"key": @"push-notification"
        }];
        
        [serverNode.mutableChildNodes addObject:pushNotificationNode];
    }
    
    if (self.quickTimeStreamingEnabled) {
        NSTreeNode *quickTimeStreamingNode = [NSTreeNode treeNodeWithRepresentedObject:@{
            @"title": @"QuickTime Streaming",
            @"key": @"quicktime-streaming"
        }];
        
        [serverNode.mutableChildNodes addObject:quickTimeStreamingNode];
    }
    
    if (self.radiusEnabled) {
        NSTreeNode *radiusNode = [NSTreeNode treeNodeWithRepresentedObject:@{
            @"title": @"RADIUS",
            @"key": @"radius"
        }];
        
        [serverNode.mutableChildNodes addObject:radiusNode];
    }
    
    if (self.smbEnabled) {
        NSTreeNode *smbNode = [NSTreeNode treeNodeWithRepresentedObject:@{
            @"title": @"SMB",
            @"key": @"smb"
        }];
        
        [serverNode.mutableChildNodes addObject:smbNode];
    }
    
    if (self.softwareUpdateEnabled) {
        NSTreeNode *softwareUpdateNode = [NSTreeNode treeNodeWithRepresentedObject:@{
            @"title": @"Software Update",
            @"key": @"software-update"
        }];
        
        [serverNode.mutableChildNodes addObject:softwareUpdateNode];
    }
    
    if (self.vpnEnabled) {
        NSTreeNode *vpnNode = [NSTreeNode treeNodeWithRepresentedObject:@{
            @"title": @"VPN",
            @"key": @"vpn"
        }];
        
        [serverNode.mutableChildNodes addObject:vpnNode];
    }
    
    if (self.webEnabled) {
        NSTreeNode *webNode = [NSTreeNode treeNodeWithRepresentedObject:@{
            @"title": @"Web",
            @"key": @"web"
        }];
        
        [serverNode.mutableChildNodes addObject:webNode];
    }
    
    if (self.xgridEnabled) {
        NSTreeNode *xgridNode = [NSTreeNode treeNodeWithRepresentedObject:@{
            @"title": @"Xgrid",
            @"key": @"xgrid"
        }];
        
        [serverNode.mutableChildNodes addObject:xgridNode];
    }
    
    return serverNode;
}

@end
