#!/bin/bash

echo "downloading SourceHan Sans font..."
wget -O SourceHanSansSC-Regular.otf https://github.com/adobe-fonts/source-han-sans/raw/release/OTF/SimplifiedChinese/SourceHanSansSC-Regular.otf
echo "downloading SourceHan Sans Bold font..."
wget -O SourceHanSansSC-Bold.otf https://github.com/adobe-fonts/source-han-sans/raw/release/OTF/SimplifiedChinese/SourceHanSansSC-Bold.otf

echo "downloading SourceHan Serif font..."
wget -O SourceHanSerifSC-Regular.otf https://github.com/adobe-fonts/source-han-serif/raw/release/OTF/SimplifiedChinese/SourceHanSerifSC-Regular.otf
echo "downloading SourceHan Serif Bold font..."
wget -O SourceHanSerifSC-Bold.otf https://github.com/adobe-fonts/source-han-serif/raw/release/OTF/SimplifiedChinese/SourceHanSerifSC-Bold.otf

echo "downloading Fandol Kai font..."
wget -O FandolKai-Regular.otf http://mirrors.ctan.org/fonts/fandol/FandolKai-Regular.otf
echo "downloading Fandol Fang font..."
wget -O FandolFang-Regular.otf http://mirrors.ctan.org/fonts/fandol/FandolFang-Regular.otf

md5sum *.otf > fonts.md5
