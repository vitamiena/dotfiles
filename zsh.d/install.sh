base_path=`pwd`
echo "creating symlinks.."

for file in zshrc zshenv
do
  ln -sf $base_path/$file $HOME/.$file
done
