echo "- Chạy thử nghiệm lệnh"
echo
TOME="$GITHUB_WORKSPACE"
chmod -R 777 $TOME/.github/bin
e2fsdroid=$TOME/.github/bin/e2fsdroid
make_ext4fs=$TOME/.github/bin/make_ext4fs
Ten=system
Tam=$TOME/tmp/tam
New=$TOME/$Ten
mkdir -p $Tam 
mkdir -p $New
Tenfc=$TOME/.github/${Ten}_file_contexts
SizeM=$((4*1024))M
touch $New/test.txt

  $make_ext4fs -J -T 1230768000 -a / -L / -l $SizeM $TOME/tmp/$Ten.img $New/ 
  tune2fs -l $TOME/tmp/$Ten.img 
  $e2fsdroid -T 1230768000 -a / -f $New/ $TOME/tmp/$Ten.img
  tune2fs -l $TOME/tmp/$Ten.img
  tune2fs -o +acl,+user_xattr -L / -M / -E hash_alg=half_md4 -O dir_index,filetype,extent,sparse_super,large_file,huge_file,uninit_bg,dir_nlink,extra_isize -e continue $TOME/tmp/$Ten.img
  #e2fsck -fy $TOME/tmp/$Ten.img 
  sudo mount -o rw,loop $TOME/tmp/$Ten.img $Tam
  ls -l $Tam
  #cd $TOME
  sudo umount -f $Tam
  tune2fs -l $TOME/tmp/$Ten.img 


