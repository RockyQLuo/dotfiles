" winpos 300 100 "设置初始界面位置
" set lines=20 columns=78       "设设置初始界面大小

set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936 
set termencoding=utf-8 
set encoding=utf-8

colorscheme desertEx

"auto syntax
syntax on

"language
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8

set textwidth=0
set modifiable

"confirm for the readonly/unsaved files when exit
set confirm

"TAB key option
set smarttab
set tabstop=4
set softtabstop=4 "available for backspace
set shiftwidth=4 
set expandtab "to expand all TABs as SPACEs

" set mapleader
let mapleader = ","

"syntax match
set showmatch
set matchtime=2

"filetype, 'indent on' is necessary for smartindent
filetype on
filetype plugin on
filetype indent on

"indent
set smartindent
set autoindent

"command
set cmdheight=2
set laststatus=2
" set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%] "显示文件名：总行数，总的字符数
set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%] "显示文件名：总行数，总的字符数
set ruler "在编辑过程中，在右下角显示光标位置的状态行




"search option
set hlsearch
set incsearch 
set ignorecase
"set ignorecase smartcase 

"line number
set number 

set nocompatible

"cursor state
set ruler

"the edge off the buffer
set scrolloff=3

"enable the backspace deletion space up to 2 lines
set backspace=2

"No automatic backup files
set nobackup

"Fold method
set foldmethod=marker " for SV
"set foldmethod=syntax " for C/C++

"Find a selected string area similar with searching word
vnoremap  *  y/<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>
vnoremap  #  y?<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>

"Mouse could be controled when INSERT model
set mouse=a
"set selection=exclusive
"set selectmode=mouse,key

"Font type and size
" set guifont=monospace\ 16.5
" set guifont=Bitstream_Vera_Sans_Mono:h10:cANSI
" set guifont=Monaco:h14
set guifont=ComicShannsMono:h14


set listchars=tab:>~,trail:.


"set guifont=Courier\ 15.5

"Hot key for MS control

"Windows control
nmap wn <C-w>n
nmap wv <C-w>v
nmap wc <C-w>c 
nmap ws <C-w>s

"tag view control
map <S-Left> :tabp<CR>
map <S-Right> :tabn<CR>

"ignore the full path of tags
function ShortTabLabel ()
    let bufnrlist = tabpagebuflist (v:lnum)
    let label = bufname (bufnrlist[tabpagewinnr (v:lnum) -1])
    let filename = fnamemodify (label, ':t')
    return filename
endfunction
set guitablabel=%{ShortTabLabel()}

"Grep hot key
nnoremap <silent><F5> :Grep<CR>
nnoremap <F4> *

" this abbreviation %% expands to the full path of the directory that contains
" the current file. For example, while editing file /some/path/myfile.txt,
" typing: e %%/ on the command line will expand to :e /some/path/.
cabbr <expr> %% expand('%:p:h') 


"Create brackets
"inoremap ( () <ESC> i
"inoremap [ [] <ESC> i
"inoremap { {} <ESC> i

"Hot key for comments
ab ccc   //-----------------------------------------------------------------------------------
ab ccl*  *************************************************************************************
ab ccl=  =====================================================================================
ab ccl#  #------------------------------------------------------------------------------------
ab ccl+  +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
ab ccl-  -------------------------------------------------------------------------------------
ab ccs   //-------------------------------------
ab cc+   +++++++++++++++++++++++++++++++++++++++
ab cc=   =======================================
ab cc*   ***************************************
ab cc-   ---------------------------------------
ab cc#   #--------------------------------------

"Self-defined function Cnt_match to count and show the matched search_wd
function Cnt_match(search_wd)
    let cnt = 0 
    let i = 1 
    let cur_line = line(".")
    normal G
    let last_lie = line(".")
    echo "Searching ... " a:search_wd

    normal gg

    while search(a:search_wd,"W") > 0 
        echo "Yes ... Line".line(".")."  >::>::>".getline(".")
        let cnt = cnt + 1
    endwhile


    echo "Match Counter : ". cnt
    execute cur_line
endfunction

"Self-defined function Clum_i to insert number to signal list
"This is helpful to name huge signal list with number
function Clum_i(start,end,span)
    let cnt = a:start
    let line_num = line(".")
    let clum_num = col(".")

    while cnt <= a:end
        execute "normal i".cnt."\<ESC>"
        let line_num = line_num + a:span + 1 
        call cursor(line_num,clum_num)
        let cnt = cnt + 1
    endwhile
    endfunction;


    "Config for treeExplorer plugin
    let g:treeExplVertical=1
    let g:treeExplDirSort=1
    let g:treeExplWinSize=30
    nmap vt :VSTreeExplore<cr>

    "Config for miniBuffer plugin
    "let g:miniBufExplVSplit = 20   " column width in chars
    "let g:miniBufExplMapWindowNavVim = 1 
    "let g:miniBufExplMapWindowNavArrows = 1 
    "let g:miniBufExplMapCTabSwitchBufs = 1 
    "let g:miniBufExplModSelTarget = 1 
    "let g:miniBufExplSplitToEdge = 0


    "Config for winManager plugin
    let g:winManagerWidth=20
    nmap wm :WMToggle<cr> 
    let g:winManagerWindowLayout = 'FileExplorer,TagsExplorer|BufExplorer'
    "let g:winManagerWindowLayout = 'FileExplorer|BufExplorer'
    "let g:winManagerAutoOpen=1

    "Config for Tlist plugin
    let Tlist_Ctags_Cmd = '/usr/bin/ctags'
    let g:Tlist_Use_Right_Window=1
    "let g:Tlist_Auto_Open=1
    let g:Tlist_Show_One_File=1
    "let g:Tlist_Compact_Format=1
    "let g:Tlist_Use_SingleClick=1
    "let g:Tlist_Enable_Fold_Column=0

    "=============================
    " showmarks setting
    "=============================
    " Enable ShowMarks
    let showmarks_enable = 1
    " Show which marks
    let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    " Ignore help, quickfix, non-modifiable buffers
    let showmarks_ignore_type = "hqm"
    " Hilight lower & upper marks
    let showmarks_hlline_lower = 1
    let showmarks_hlline_upper = 1 
    hi ShowMarksHLl ctermbg=Yellow   ctermfg=Black  guibg=#FFDB72    guifg=Black
    hi ShowMarksHLu ctermbg=Magenta  ctermfg=Black  guibg=#FFB3FF    guifg=Black 

    "=============================
    " markbrowser setting
    "=============================
    nmap <silent> <leader>mk :MarksBrowser<cr> 

    "=============================
    " main.xml syntax setting
    "=============================

    "===============================
    "vundle
    "=============================
    set nocompatible " be iMproved, required
    filetype off " required
    set rtp+=~/.vim/bundle/Vundle.vim 
    call vundle#begin()
    " alternatively, pass a path where Vundle should install plugins
    " call vundle#begin('~/some/path/here')
    " let Vundle manage Vundle, required
    Plugin 'VundleVim/Vundle.vim'

    " Plugin 'vim-airline'
    Plugin 'vim-commentary'
    Plugin 'https://github.com/preservim/nerdtree.git'
    Plugin 'https://github.com/junegunn/fzf.vim.git'
    Plugin 'https://github.com/junegunn/fzf.git'
    call vundle#end()
    filetype plugin indent on

    " 打开vim时,自动打开NERDTree
    "autocmd vimenter * NERDTree

    " 设置NerdTree打开的快捷键,可自行更改
    map <F2> :NERDTreeMirror<CR>
    map <F2> :NERDTreeToggle<CR>




    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    """""新文件标题
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "新建.c,.h,.sh,.java文件，自动插入文件头 
    autocmd BufNewFile *.[ch],*.sh,*.java exec ":call SetTitle()" 
    "定义函数SetTitle，自动插入文件头 
    func SetTitle() 
        "如果文件类型为.sh文件 
        if &filetype == 'sh' 
            call setline(1, "##########################################################################") 
            call append(line("."), "# File Name: ".expand("%")) 
            call append(line(".")+1, "# Author: qluo") 
            call append(line(".")+2, "# mail: qluo@std.uestc.edu.cn") 
            call append(line(".")+3, "# Created Time: ".strftime("%c")) 
            call append(line(".")+4, "#########################################################################") 
            call append(line(".")+5, "#!/bin/zsh")
            call append(line(".")+6, "PATH=/home/edison/bin:/home/edison/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/work/tools/gcc-3.4.5-glibc-2.3.6/bin")
            call append(line(".")+7, "export PATH")
            call append(line(".")+8, "")
        else 
            call setline(1, "/*************************************************************************") 
            call append(line("."), "	> File Name: ".expand("%")) 
            call append(line(".")+1, "	> Author: qluo") 
            call append(line(".")+2, "	> Mail: qluo@std.uestc.edu.cn") 
            call append(line(".")+3, "	> Created Time: ".strftime("%c")) 
            call append(line(".")+4, " ************************************************************************/") 
            call append(line(".")+5, "")
        endif
        if &filetype == 'cpp'
            call append(line(".")+6, "#include<iostream>")
            call append(line(".")+7, "using namespace std;")
            call append(line(".")+8, "")
        endif
        if &filetype == 'c'
            call append(line(".")+6, "#include<stdio.h>")
            call append(line(".")+7, "")
        endif
        "	if &filetype == 'java'
        "		call append(line(".")+6,"public class ".expand("%"))
        "		call append(line(".")+7,"")
        "	endif
        "新建文件后，自动定位到文件末尾
        autocmd BufNewFile * normal G
    endfunc 
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    ""实用设置
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "代码补全 
    set completeopt=preview,menu
    "共享剪贴板  
    set clipboard=unnamed

    set ruler                   " 打开状态栏标尺
    set cursorline              " 突出显示当前行
    set magic                   " 设置魔术
    set guioptions-=T           " 隐藏工具栏
    set guioptions-=m           " 隐藏菜单栏

    set foldenable              " 开始折叠
    set foldmethod=syntax       " 设置语法折叠
    set foldcolumn=0            " 设置折叠区域的宽度
    setlocal foldlevel=1        " 设置折叠层数为
    set foldlevelstart=99       " 打开文件是默认不折叠代码"
    set foldclose=all          " 设置为自动关闭折叠                
    nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR> "空格开关折叠

    " 语法高亮
    "set syntax=on
    "禁止生成临时文件
    "set nobackup
    set noswapfile
    "搜索忽略大小写
    "set ignorecase


    nmap <leader>w :w!<cr>
    nmap <leader>q :q<cr>
    nmap <leader>f :find<cr>

    " 映射全选+复制 ctrl+a
    map <C-A> ggVGY
    map! <C-A> <Esc>ggVGY
    map <F12> gg=G
    map <leader>f :FZF <cr>
    " 选中状态下 Ctrl+c 复制
    vmap <C-c> "+y

    " 使用powerline打过补丁的字体
    let g:airline_powerline_fonts = 1
    " 开启tabline
    let g:airline#extensions#tabline#enabled = 1
    " tabline中当前buffer两端的分隔字符
    let g:airline#extensions#tabline#left_sep = ' '
    " tabline中未激活buffer两端的分隔字符
    let g:airline#extensions#tabline#left_alt_sep = ' '
    " tabline中buffer显示编号
    let g:airline#extensions#tabline#buffer_nr_show = 1
    " 映射切换buffer的键位
    nnoremap [b :bp<CR>
    nnoremap ]b :bn<CR>
    " 映射<leader>num到num buffer
    map <leader>1 :b 1<CR>
    map <leader>2 :b 2<CR>
    map <leader>3 :b 3<CR>
    map <leader>4 :b 4<CR>
    map <leader>5 :b 5<CR>
    map <leader>6 :b 6<CR>
    map <leader>7 :b 7<CR>
    map <leader>8 :b 8<CR>
    map <leader>9 :b 9<CR>

    " 开启或关闭行号显示
    nnoremap <leader>n :set number!<CR>

    inoremap ' ''<ESC>i
    inoremap " ""<ESC>i
    inoremap ( ()<ESC>i
    inoremap [ []<ESC>i
    inoremap { {<CR>}<ESC>O




" 下面是调用python写tb
"-------------------------------------------------------------------
"    auto testbench (python)
"-------------------------------------------------------------------
:nnoremap <leader>tb :call Autotb()<cr>
function! Autotb()
python << EOF

import vim,re
CLK_FREQ=5   #时钟多少ns反转一次
RST_TIME=100   #时钟多少ns反转一次
# 清除所有注释内容
def clear_commonts(lines):
   
    block_comment_index = []  # record block comment index
    # remove // comment 
    for i in range(len(lines)):
        lines[i] = re.sub('//.*$','',lines[i])
        all_pairs = re.findall(r'/\*',lines[i])
        if(all_pairs != []):
            next_index = 0
            new_line = lines[i]
            for j in range(len(all_pairs)): 
                find_index = re.search(r'/\*',new_line).span()
                next_index = find_index[1]
                new_line = new_line[next_index:]
                block_comment_index.append(i)
                if(re.search(r'\*/',new_line)!=None): # find paired */
                    block_comment_index.append(i)
        else:
            if(re.search(r'\*/',lines[i])!=None): # find paired */
                block_comment_index.append(i)
    if(len(block_comment_index)%2!=0):
        raise('ERROR: /* and */ not paired')
    else:
        for i in range(int(len(block_comment_index)/2)):
            left_index = block_comment_index[i*2]
            right_index = block_comment_index[i*2+1]
            if(left_index==right_index):               # inline /* */
                lines[left_index] = re.sub(r'/\*.*\*/','',lines[left_index])
            else: 
                for j in range(left_index+1,right_index):  # delet comment in block /* */
                    lines[j] = ''
                lines[left_index] = re.sub(r'/\*.*$','',lines[left_index])
                lines[right_index] = re.sub(r'^.*\*/','',lines[right_index])
    
    return lines

# 找到模块名
def find_inst_name(line):
    pattern = re.compile(r'(module)\s+(\w+)')
    if(pattern.search(line)!=None):
        return pattern.search(line).group(2)
    else:
        return ''

# 文本行转换为字符串
def lines2string(lines):
    string = ''
    for l in lines:
      string += l
    return string

# 获取输入输出端口名以及位宽，符号
def find_port_and_width(s):
    signed_flag = 0
    l_tmp = re.sub('(input)|(output)|(inout)','',s,1) # count=1 will not sub these word in signal name
    l_tmp = re.sub('(wire)|(reg)','',l_tmp,1)
    if(re.search(r'\sunsigned[\s\[]',l_tmp)!=None):
        signed_flag = 'unsigned'
    elif(re.search(r'\ssigned[\s\[]',l_tmp)!=None):
        signed_flag = 'signed'
    else:
        signed_flag = ' '
    l_tmp = re.sub('(signed)|(unsigned)','',l_tmp,1)
    l_tmp = re.sub(r'\s','',l_tmp)
    if(re.search(r'\[.+\]',l_tmp)!=None):
        width = re.search(r'\[.+\]',l_tmp).group(0)
        l_tmp = re.sub(r'\[.+\]','',l_tmp)
    else:
        width = '1'
    #print(l_tmp)
    if(re.search(r'\w+(?=[;,\s\)])',l_tmp)!=None):
        port_name = re.search(r'\w+(?=[;,\s\)])',l_tmp).group(0)
    else:
        raise('Port name lost!')
    #print(width,port_name,signed_flag)
    return width,port_name,signed_flag

# 寻找模块例化中定义段parameter变量
def find_parameter(s):
    l_tmp = re.sub(r'\s','',s)
    name_search = re.search(r'\w+(?=\=)',l_tmp)
    val_search = re.search(r'(?<=\=)[\w\+\-\*/\%\$\'`]+',l_tmp)
    if(name_search!=None):
        name = name_search.group(0)
    else:
        name = ''
    if(val_search!=None):
        val = val_search.group(0)
    else:
        val = ''
    return name,val

# 寻找模块的输入输出
def find_input_output(lines):
    inst_dict = {'name':'','input':[],'output':[],'inout':[],'para':[]}
    string = lines2string(lines)
    inst_dict['name'] = find_inst_name(string)
    if inst_dict['name'] == '':
      raise('Inst name lost!')
    output_pattern = re.compile(r'\Woutput[\[\s][\w\s\[\]:\+\-\*/\(\)%\{\}\'`]*[,;]') # include 0-9 a-z A-Z [:] \n
    input_pattern = re.compile(r'\Winput[\[\s][\w\s\[\]:\+\-\*/\(\)%\{\}\'`]*[,;]') # include 0-9 a-z A-Z [:] \n 
    inout_pattern = re.compile(r'\Winout[\[\s][\w\s\[\]:\+\-\*/\(\)%\{\}\'`]*[,;]') # include 0-9 a-z A-Z [:] \n 
    input_list = input_pattern.findall(string)
    output_list = output_pattern.findall(string)
    inout_list = inout_pattern.findall(string)
    
    para_search_end_index = input_pattern.search(string).span()[0]
   # print (string[:para_search_end_index])
    para_pattern = re.compile(r'\Wparameter\s+[\s\w\[\]:\+\-\*/\(\)%\{\}\=,\'`]*')
    para_search = para_pattern.search(string[:para_search_end_index])
    if(para_search!=None):
        para_string = para_search.group(0)
        #print(para_string)
        para_string = ' '+para_string
        para_string = re.sub(r'\sparameter\s','',para_string)
        para_list = para_string.split(',')
       # print(para_list)
        for l in para_list:
            inst_dict['para'].append(find_parameter(l))
        
    else:
        inst_dict['para'] = []

    
    
    for l in input_list:
        inst_dict['input'].append(find_port_and_width(l))
    for l in output_list:
        inst_dict['output'].append(find_port_and_width(l))
    for l in inout_list:
        inst_dict['inout'].append(find_port_and_width(l))
 
    return inst_dict

def max_len(ll,mode=0):
    max_len = 1
    for l in ll:
        if(len(l[mode])>max_len):
            max_len = len(l[mode])
    return max_len

def build_input_port_tb(in_list,mode='input'):
    max_in_len_width = max_len(in_list,0)
    max_in_len_signed = max_len(in_list,2)
    string = ''
    net_type = {'input':'reg','output':'wire','inout':'wire'}
    for in_port in in_list:
        in_name = in_port[1]
        width = in_port[0] if in_port[0]!='1' else ''    #三元运算符
        signed_type = in_port[2]
        added_len_signed = max_in_len_signed - len(signed_type)
        added_len_width =  max_in_len_width - len(width)
        s = '%s %s '%(net_type[mode],signed_type) + added_len_signed*' '
        s += '%s'%(width) + added_len_width*' ' + ' %s;\n'%(in_name)
        #print(max_in_len_width)
        #print(max_in_len_signed)
        string += s
    return string
  
def build_para_tb(in_list):
    max_in_len = max_len(in_list,0)
    string = ''
    for in_port in in_list:
        in_name = in_port[0]
        number = in_port[1]
        added_len = max_in_len - len(in_name)
        s = 'parameter %s '%(in_name) + added_len*' '+'= %s;\n'%(number)
        string += s
    return string

# 寻找模块中的clk和rst
def find_clk_and_rst(in_list):
    clk = ''
    rst = ''
    clk_pattern = re.compile(r'\b\w*clk\b')
    clk_collect=[]
    for tup in in_list:
      clk_collect.append(tup[1])     
    clk = clk_pattern.findall(" ".join(clk_collect))

    rst_pattern = re.compile(r'\b\w*(?:rst|rst_n)\b', re.I)
    rst_collect=[]
    for tup in in_list:
      rst_collect.append(tup[1])    
    rst = rst_pattern.findall(" ".join(rst_collect))
    return clk,rst

def input_initial_tb(in_list,rst):
    string = 'initial begin\n'
    for l in in_list:
        for _ in rst:
          if(l[1] != _ ):
            s = '  %s = 0;\n'%l[1]
            string += s
          break
    string += '\n'
    for _ in rst:
      rst_kind = re.search('(?<=rst)_?n',_,re.I)==None #1:rst, 0:rst_n
      string += '  %s = %d;\n'%(_,rst_kind)
    string += '  #RST_TIME\n'
    for _ in rst:
      rst_kind = re.search('(?<=rst)_?n',_,re.I)==None #1:rst, 0:rst_n
      string += '  %s = %d; \n'%(_,1-rst_kind)
    string += 'end\n'
    return string
    
# 生成模块例化代码
def build_inst(inst_dict):
    inst_name = inst_dict['name']
    name_len = len(inst_name)
    string = inst_name
    if(inst_dict['para']==[]):
        para_string = ' '
    else:
        para_string = ' #(\n'
        para_max_in_len = max_len(inst_dict['para'],0)
        for i,para_port in enumerate(inst_dict['para']):
            para_name = para_port[0]
            number = para_port[1]
            added_len = para_max_in_len - len(para_name)
            s = '  .%s '%(para_name) + added_len*' '+'( '+ para_name +added_len*' '+' )'+(i!=len(inst_dict['para'])-1)*','+(i==len(inst_dict['para'])-1)*')'+'\n'
            para_string += s 

    string += para_string
    string += 'U_'+ inst_name.upper()+'_0\n'
    # port inst
    port_list = inst_dict['input']+inst_dict['output']+inst_dict['inout']
    port_max_in_len = max_len(port_list,1)
    port_string = '('
    for i,port in enumerate(port_list):
        port_name = port[1]
        added_len = port_max_in_len - len(port_name)
       # print(port_list)
        s =  (i!=0)*' '+'  .%s '%(port_name) + added_len*' '+'( '+ port_name + added_len*' '+' )'+(i!=len(port_list)-1)*','+(i==len(port_list)-1)*');'+'\n'
        port_string += s
    
    string += port_string
    return string

# 增加dumpvar相关命令，vcs+verdi调试需要
def add_dumpvars():
    string = '\ninitial begin\n  $fsdbDumpvars();\n  $fsdbDumpMDA();\n  $dumpvars();\n  #1000 $finish;\nend'
    return string

# 增加头部信息
def add_head(name,author='qluo'):
    import time
    now_time = time.strftime("%Y-%m-%d %H:%M:%S", time.localtime()) 
    year = now_time[0:4]
    string = "// -----------------------------------------------------------------\n//                 Copyright (c) %s .\n//                       ALL RIGHTS RESERVED\n// -----------------------------------------------------------------\n// Filename      : %s.v\n// Author        : %s\n// Created On    : %s\n// Last Modified :\n// -----------------------------------------------------------------\n// Description:this is a simple tb for %s.v\n//\n// -----------------------------------------------------------------\n"%(year,name,author,now_time,name.replace('_tb', ''))
    return string

# 生成tb
def build_tb(inst_dict):
    string = add_head(name=inst_dict['name']+'_tb')
    string += '\n`timescale 1ns/1ps\n\n'
    string += 'module %s();\n\n'%(inst_dict['name']+'_tb')
    string += build_para_tb(inst_dict['para'])
    string += '\n'
    string += 'parameter CLK_FREQ=%d\n'%(CLK_FREQ)
    string += 'parameter RST_TIME=%d'%(RST_TIME)
    string += '\n'
    string += '\n'
    string += build_input_port_tb(inst_dict['input'],'input')
    string += '\n'
    string += build_input_port_tb(inst_dict['output'],'output') 
    string += '\n'
    string += build_input_port_tb(inst_dict['inout'],'inout')
    clk,rst = find_clk_and_rst(inst_dict['input'])
    for _ in clk:
        string += '\nalways ' + f'#CLK_FREQ '+ '%s = ~%s;\n'%(_,_)
    string += input_initial_tb(inst_dict['input'],rst)
    string += '\n'
    string += build_inst(inst_dict)
    string += '\n'
    string += add_dumpvars()
    string += '\n'
    string += '\nendmodule\n'
    return string


lines = []
for l in vim.current.buffer[:]:
  lines.append(l+'\n')  # string in buffer do not contain '\n'

clear_lines = clear_commonts(lines)
inst_dict = find_input_output(clear_lines)
tb_string = build_tb(inst_dict)

# 调用vim的python接口，生成一个新的窗口，在新窗口构建tb
vim.command("badd %s"%(inst_dict['name']+'_tb.v'))
buffer_num = len(vim.buffers)
print(buffer_num)
vim.command("tabnew")
vim.command("b"+str(buffer_num))
vim.current.buffer[:] = tb_string.split('\n')
#vim.command('NERDTree')
print(f'tb made successfully')
EOF

endfunction
