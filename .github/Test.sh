echo "- Chạy thử nghiệm lệnh"
echo
TOME="$GITHUB_WORKSPACE"
chmod -R 777 $TOME/.github/bin
e2fsdroid=$TOME/.github/bin/e2fsdroid
$e2fsdroid

