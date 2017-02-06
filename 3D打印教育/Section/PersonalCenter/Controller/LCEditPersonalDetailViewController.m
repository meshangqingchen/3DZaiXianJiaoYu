//
//  LCEditPersonalDetailViewController.m
//  3D打印教育
//
//  Created by 3D on 17/1/9.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCEditPersonalDetailViewController.h"
#import "LCEditPersonalDetailViewModel.h"

#import "LCEditPersonalDetailCell.h"
#import <MobileCoreServices/MobileCoreServices.h>
@interface LCEditPersonalDetailViewController ()
<
UIActionSheetDelegate,
UIImagePickerControllerDelegate,
UINavigationControllerDelegate
>
@property(nonatomic,strong) LCEditPersonalDetailViewModel *viewModel;
@property(nonatomic,strong) UITableView *tableView;
@end

static NSString *identifier = @"LCSetingCell";
static NSString *identifierHeader = @"UITableViewHeaderFooterView";

@implementation LCEditPersonalDetailViewController
@dynamic viewModel,tableView;
- (void)viewDidLoad {
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64) style:UITableViewStylePlain];
    self.tableView.backgroundColor = [KDColor getC19Color];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerClass:[LCEditPersonalDetailCell class] forCellReuseIdentifier:identifier];
    [self.tableView registerClass:[UITableViewHeaderFooterView class] forHeaderFooterViewReuseIdentifier:identifierHeader];
    
    [self.view addSubview:self.tableView];
    
    self.tableView.tableFooterView = [UIView new];
    
    [super viewDidLoad];

  }

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.viewModel.dataSource.count;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *setionArr = self.viewModel.dataSource[section];
    return setionArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LCEditPersonalDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    NSArray *setionArr = self.viewModel.dataSource[indexPath.section];
    [cell bindViewModel:setionArr[indexPath.row]];
    return cell;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UITableViewHeaderFooterView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:identifierHeader];
    header.contentView.backgroundColor = [KDColor getC19Color];
    return header;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0 & indexPath.row == 0) {
        //头像
        UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:@"更换头像" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"相机拍摄" otherButtonTitles:@"从相册选取",nil];
        [actionSheet showInView:self.view];
    }else if (indexPath.section == 0 & indexPath.row == 2){
        //头像
        UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:@"性别" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"男" otherButtonTitles:@"女",nil];
        [actionSheet showInView:self.view];
    }else{
        [self.viewModel didSelectRowAtIndexPath:indexPath in:tableView];
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0 & indexPath.row == 0) {
        return 64;
    }
    return 44;
}


#pragma mark - UIActionSheetDelegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *title = [actionSheet buttonTitleAtIndex:buttonIndex];
    
    if ([title isEqualToString:@"相机拍摄"]) {
        UIImagePickerController *picker=[[UIImagePickerController alloc]init];
        picker.sourceType=UIImagePickerControllerSourceTypeCamera;
//        picker.mediaTypes=[UIImagePickerController availableMediaTypesForSourceType:picker.sourceType];
        
//         NSString *requiredMediaType = 
        
        NSString *requiredMediaType = ( NSString *)kUTTypeImage;
        picker.mediaTypes = [NSArray arrayWithObjects:requiredMediaType,nil];
        picker.allowsEditing=YES;
        picker.delegate=self;
        [self presentViewController:picker animated:YES completion:nil];
        
    }else if ([title isEqualToString:@"从相册选取"]){
        UIImagePickerController *picker=[[UIImagePickerController alloc]init];
        picker.sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
//        picker.mediaTypes=[UIImagePickerController availableMediaTypesForSourceType:picker.sourceType];
        picker.allowsEditing=YES;
        picker.delegate=self;
        [self presentViewController:picker animated:YES completion:nil];
        
    }else if ([title isEqualToString:@"男"]|[title isEqualToString:@"女"]){
        !self.viewModel.selectSex ? : self.viewModel.selectSex(title);
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    UIImage *image=[info objectForKey:UIImagePickerControllerEditedImage];
    !self.viewModel.changeHeadImage ? : self.viewModel.changeHeadImage(image);
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


@end
