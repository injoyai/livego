#-ldflags="-w -s"
#-ldflags="-H windowsgui"
#-ldflags="-X "

name="livego"
dir="/bin"

GOOS=windows GOARCH=amd64 go build -v -ldflags="-w -s" -o .$dir/$name.exe

echo "Windows编译完成..."
echo "开始压缩..."
upx -9 -k ".$dir/$name.exe"

GOOS=linux GOARCH=amd64 go build -v -ldflags="-w -s" -o .$dir/$name
 echo "linux_amd64编译完成..."
 echo "开始压缩..."
 upx -9 -k ".$dir/$name"

if [ -f ".$dir/$name.ex~" ]; then
  rm ".$dir/$name.ex~"
fi
if [ -f ".$dir/$name.~" ]; then
  rm ".$dir/$name.~"
fi
if [ -f ".$dir/$name.000" ]; then
  rm ".$dir/$name.000"
fi

sleep 2
