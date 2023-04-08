% Image Affine transformation
% Translation + Rotation
function img_out = fun_affine2(img, trans_matrix, rotate_matrix)
    % img = niftiread('Attmap_CT_Crop.nii');
    % trans_matrix  = [tx, ty, ty];
    % rotate_matrix = [rx, ry, rz];
    tx = trans_matrix(1);
    ty = trans_matrix(2);
    tz = trans_matrix(3);

    rx = rotate_matrix(1);
    ry = rotate_matrix(2);
    rz = rotate_matrix(3);
    
    % Image Rotation: x - y - z
    img_rotate_x = imrotate3(img,          rx, [0 1 0],'linear','crop','FillValues',0);
    img_rotate_y = imrotate3(img_rotate_x, ry, [1 0 0],'linear','crop','FillValues',0);
    img_rotate_z = imrotate3(img_rotate_y, rz, [0 0 1],'linear','crop','FillValues',0);
    
    % Image Translation
    img_trans = imtranslate(img_rotate_z, [ty, tx, tz], 'method', 'nearest');
    
    img_out = img_trans;
