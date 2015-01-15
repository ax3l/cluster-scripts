#!/bin/bash
#
# Copyright 2013-2015 Axel Huebl
#
# ISC License
#
# A prompt/PS1 example
#
# Inspired by
#   http://makandracards.com/makandra/1090-customize-your-bash-prompt

./bash-nicePwd.sh

right_git()
{
    type __git_ps1 > /dev/null 2>&1
    if [ $? -ne 0 ] ; then
      return 0; fi
    GITSTR=$(__git_ps1 "(%s)")
    #escape %
    GITSTR=${GITSTR//%/%%}
    GITF=`[[ $(git status 2> /dev/null | head -n2 | tail -n1) != '# Changes to be committed:' ]] && echo$
    GITF=$GITF"`[[ $(git status 2> /dev/null | tail -n1) != 'nothing to commit (working directory clean)$
    FULLSTR="$GITF$GITSTR\e[00m\r"
    printf "%$((COLUMNS-${#GITSTR}))s$FULLSTR"
}
queue_info()
{
    myQueue=`cat $HOME/.getShortUserInfo.txt`" "
}

PROMPT_COMMAND='right_git;nice_pwd;queue_info'
PS1=

# Ref: http://makandracards.com/makandra/1090-customize-your-bash-prompt
PS1=$PS1'\[\e[00;37m\]\u@\h\[\e[01;37m\]:'
PS1=$PS1"\[\e[01;34m\]\$myPWD\[\e[00m\] \$myQueue"
PS1=$PS1'`es=$?; if [ $es = 0 ]; then echo "\[\e[32m\]✔ "; else echo "\[\e[31m\]✘ $es "; fi`\[\e[00m\]'
# git integration
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWUPSTREAM=true
PS1=$PS1'\$ '

# only execute this command on the head node(s)
# here: hostnames starting with "hypnos"
if [[ `hostname` == hypnos* ]] ; then
  ./freeNodes.sh kepler
fi
