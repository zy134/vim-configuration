## vim配置

&emsp;&emsp;本方案的目标是将vim配置成一个合格的C++ IDE，拥有补全，代码检测，异步运行等功能。

&emsp;&emsp;首先安装vundle，不多做介绍。主要说一下ycm的安装。直接通过vundle安装ycm经常失败，我就想着应该是需要fq的缘故，本人又比较懒，所以折腾了另一条路子：

``` 
sudo apt-get install vim-addons
sudo apt-get install vim-youcompleteme
vim-addons install youcompleteme
```

&emsp;&emsp;addons也是一个vim插件管理组件，这么搞在ubuntu和deepin上效果都还不错，比把repo弄下来一步步配置省心多了。

&emsp;&emsp;接下来的配置信息我在vimrc里都有注释，就不多废话了，直接copy下来就行