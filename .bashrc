# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

# export LS_COLORS
alias ls='ls --color=auto'

export PATH=$PATH:/usr/local/bin
export PATH=$PATH:/usr/lib64/mpich/bin
#export LD_LIBRARY_PATH=/usr/lib64/mpich/lib:$LD_LIBRARY_PATH
#export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:/usr/include/mpich-x86_64

alias wu29='ssh -Y -p 2727 wuhongyi@162.105.151.29'

#source /opt/root53436/bin/thisroot.sh
#source /opt/root60606debug/bin/thisroot.sh
source /opt/root60806/bin/thisroot.sh

########## GEANT4 ##########
# path to freya data
#export FREYADATAPATH=~/CodeProject/data/data_freya
source /opt/Geant4/geant41003p01/bin/geant4.sh
#source /opt/Geant4/geant41002p02/bin/geant4.sh
#source /opt/Geant4/geant41003wuhongyi/bin/geant4.sh

# export NeutronHPNames=1
# export NeutronHPNamesLogging=1
# export G4ParticleHPDebug=1
# export yG4ParticleHPDebug_NamesLogging=1
# export NeutronHPCapture=1
# export CaptureDataIndexDebug=1
# export G4PHPTEST=1
## Activates the physics for isotopes with Z>92 (recommended).
# export AllowForHeavyElements=1


# export G4NEUTRONHP_USE_ONLY_PHOTONEVAPORATION=1
# export G4NEUTRONHP_NEGLECT_DOPPLER=1
##忽略多普勒效应
# export G4PHP_NEGLECT_DOPPLER=1
# export G4NEUTRONHP_PRODUCE_FISSION_FRAGMENTS=1
# export G4NEUTRON_HP_USE_WENDT_FISSION_MODEL=1


## It sets to zero the cross section of the isotopes which are not present in the neutron library. If GEANT4 doesn’t find an isotope, then it looks for the natural composition data of that element. Only if the element is not found then the cross section is set to zero. On the contrary, if this variable is not defined, GEANT4 looks then for the neutron data of another isotope close in Z and A, which will have completely different nuclear properties and lead to incorrect results (highly recommended).
# export G4NEUTRONHP_SKIP_MISSING_ISOTOPES=1

## If this variable is not defined, a GEANT4 model that attempts to satisfy the energy and momentum conservation in some nuclear reactions, by generating artificial gamma rays. By setting such a variable one avoids the correction and leads to the result obtained with the ENDF-6 libraries. Even though energy and momentum conservation are desirable, the ENDF-6 libraries do not provide the necessary correlations between secondary particles for satisfying them in all cases. On the contrary, ENDF-6 libraries intrinsically violate energy and momentum conservation for several processes and have been built for preserving the overall average quantities such as average energy releases, average number of secondaries... (highly recommended).
# export G4NEUTRONHP_DO_NOT_ADJUST_FINAL_STATE=1

# export DO_NOT_SET_PHP_AS_HP=1
# export G4PHP_DO_NOT_ADJUST_FINAL_STATE=1
########## GEANT4 ##########



source /opt/intel/bin/compilervars.sh intel64
#export INTEL_LICENSE_FILE=/opt/intel/licenses/*.lic

export GARFIELD_HOME=/opt/Garfield
export HEED_DATABASE=$GARFIELD_HOME/Heed/heed++/database/

export PLX_SDK_DIR=/opt/PlxSdk


alias wugitbookrootnote='gitbook serve --lrport 35288 --port 4001 /home/wuhongyi/workgithub/Note/ROOTNote'
alias wugitbookdaqnote='gitbook serve --lrport 35287 --port 4002 /home/wuhongyi/workgithub/Note/DAQNote'
alias wugitbookmanual='gitbook serve --lrport 35286 --port 4003 /home/wuhongyi/CodeProject/Manual'

alias wuelog='elogd -c ~/CodeProject/elog/elogd.cfg -p 8001'
alias wuhexo='cd /home/wuhongyi/Hexo/ && hexo s -p 8002'

#alias root='`source /opt/root60212/bin/thisroot.sh` root -l'
alias root='root -l'

#using C++11
alias g++='g++ -std=c++11'

alias wuvalgrind='valgrind --tool=memcheck --leak-check=yes --show-reachable=yes' 
alias wuvalgrindunreachable='valgrind --tool=memcheck --leak-check=yes' 
alias make='make VERBOSE=1'

alias wugroot='g++ `root-config --cflags --glibs` -l Spectrum'

alias wumd2html='pandoc -c ~/CodeProject/ShellAndTemplate/css/wuMarkdownStyle.css -s '

alias wucipanshiyong='df -hl'

alias wuls='ls -ash'
alias wuemacs='emacs -nw'

alias wugitpushmaster='git push -u origin master'
alias wugitpushsource='git push -u origin source'
alias wugitpullmaster='git pull origin master'

alias wuultraedit30='rm -rf ~/.idm/*.spl | rm -rf ~/.idm/uex/* | rm -rf /tmp/*.spl | rm -rf ~/.local/share/* | /usr/local/bin/uex &'

#解压缩
alias wujieyatar='tar -xvf'
alias wujieyatargz='tar -xzvf'
alias wujieyatarbz2='tar -xzvf'
alias wujieyatarZ='tar -xZvf'
alias wujieyazip='unzip'


source /home/wuhongyi/CodeProject/RadWare53/.radware.bashrc
export PATH=$PATH:/home/wuhongyi/CodeProject/RadWare53/bin


#fresco
#export PATH=/usr/local/grace/bin/:$PATH

#MIDAS
# export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/MIDAS/lib_Linux64
# export PATH=$PATH:/MIDAS/bin
# alias wumidas='/MIDAS/bin_Linux64/MIDAS64-session'


# TeX Live 2015
export MANPATH=${MANPATH}:/usr/local/texlive/2015/texmf-dist/doc/man
export INFOPATH=${INFOPATH}:/usr/local/texlive/2015/texmf-dist/doc/info
export PATH=${PATH}:/usr/local/texlive/2015/bin/x86_64-linux


PATH=$PATH:/usr/local/MATLAB/R2015b/bin	
# export LIBRARY_PATH=$LIBRARY_PATH:/usr/local/MATLAB/R2015b/bin/glnxa64
# export CPLUS_INCLUDE_PATH=CPLUS_INCLUDE_PATH:/usr/local/MATLAB/R2015b/extern/include
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/MATLAB/R2012a/bin/glnxa64:/usr/local/MATLAB/MATLAB_Compiler_Runtime/v717/runtime/glnxa64:/usr/local/MATLAB/MATLAB_Compiler_Runtime/v717/bin/glnxa64:/usr/local/MATLAB/MATLAB_Compiler_Runtime/v717/sys/os/glnxa64:/usr/local/MATLAB/MATLAB_Compiler_Runtime/v717/sys/java/jre/glnxa64/jre/lib/amd64/native_threads:/usr/local/MATLAB/MATLAB_Compiler_Runtime/v717/sys/java/jre/glnxa64/jre/lib/amd64/server:/usr/local/MATLAB/MATLAB_Compiler_Runtime/v717/sys/java/jre/glnxa64/jre/lib/amd64

#这个 alias 保证了你用 mat 命令可以直接启动命令行模式的 matlab
alias mat='matlab -nodesktop -nosplash'
#这个 alias 保证了你用 mrun xxx 可以直接运行 .m 文件,调用时需要省略后缀名.m
alias mrun='matlab -nodesktop -nosplash -nojvm -r'
		
# User specific aliases and functions

export NVM_DIR="/home/wuhongyi/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm


export QSYS_ROOTDIR="/home/wuhongyi/intelFPGA/17.1/quartus/sopc_builder/bin"

PATH=$PATH:/home/wuhongyi/babirl/bin/
export TARTSYS=/home/wuhongyi/VMEDAQ/anaroot
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$TARTSYS/lib:$TARTSYS/sources/Core



# GCC命令行的选项:
# -shared 该选项指定生成动态连接库，不用该标志外部程序无法连接。相当于一个可执行文件
# l -fPIC：表示编译为位置独立的代码，不用此选项的话编译后的代码是位置相关的所以动态载入时是通过代码拷贝的方式来满足不同进程的需要，而不能达到真正代码段共享的目的。
# l -L.：表示要连接的库在当前目录中
# l -ltest：编译器查找动态连接库时有隐含的命名规则，即在给出的名字前面加上lib，后面加上.so来确定库的名称
# l LD_LIBRARY_PATH：这个环境变量指示动态连接器可以装载动态库的路径。
# l 当然如果有root权限的话，可以修改/etc/ld.so.conf文件，然后调用 /sbin/ldconfig来达到同样的目的，不过如果没有root权限，那么只能采用输出LD_LIBRARY_PATH的方法了。

# 调用动态库的时候有几个问题会经常碰到，有时，明明已经将库的头文件所在目录 通过 “-I” include进来了，库所在文件通过 “-L”参数引导，并指定了“-l”的库名，但通过ldd命令察看时，就是死活找不到你指定链接的so文件，这时你要作的就是通过修改 LD_LIBRARY_PATH或者/etc/ld.so.conf文件来指定动态库的目录。通常这样做就可以解决库无法链接的问题了。

# 静态库链接时搜索路径顺序：
# 1. ld会去找GCC命令中的参数-L
# 2. 再找gcc的环境变量LIBRARY_PATH
# 3. 再找内定目录 /lib /usr/lib /usr/local/lib 这是当初compile gcc时写在程序内的

# 动态链接时、执行时搜索路径顺序:
# 1.  编译目标代码时指定的动态库搜索路径；
# 2.  环境变量LD_LIBRARY_PATH指定的动态库搜索路径；
# 3.  配置文件/etc/ld.so.conf中指定的动态库搜索路径；
# 4. 默认的动态库搜索路径/lib；
# 5. 默认的动态库搜索路径/usr/lib。

# 有关环境变量：
# LIBRARY_PATH环境变量：指定程序静态链接库文件搜索路径
# LD_LIBRARY_PATH环境变量：指定程序动态链接库文件搜索路径
