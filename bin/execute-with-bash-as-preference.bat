@goto :batch-script > /dev/null 2>&1 # > nul

# ****************************************************************************
# Usage: execute-with-bash-as-preference program arg1 arg2 arg3...
#
# This is a Polyglot script that is interperated differently by bash and batch
# We use this to first set the JuliaWin environment in batch and then search
# for a possible sh.exe binary also in bash and then finally run the command
# under sh.exe in order to pass all commandline arguments directly.
# ****************************************************************************


# ****************************************************************************
# Over here is the sh/bash part of the script
# ****************************************************************************
"$@"
exit $?


:: ****************************************************************************
:: Over here is the batch part of the script
:: ****************************************************************************
:batch-script
@echo off
setlocal

call "%~dp0\set-juliawin-environment.bat"
call %functions% GET-GIT-BASH-PATH git-bash-path


if "%git-bash-path%" equ "" goto :cannot-run-bash

	:: Running under bash
	call "%git-bash-path%" "%~dp0%~n0.bat" %*
	exit /b %errorlevel%


:cannot-run-bash
	:: Running under cmd

	echo Warning, no Git MinGW environment could be established from the following locations:
	echo `where sh`, `where git`, %%PROGRAMFILES%%\Git\bin\sh.exe and %%ProgramFiles(x86)%%\Git\bin\sh.exe
	echo You need to have Git installed from git-scm.com for Julia to access the posix shell.

	call %*
	exit /b %errorlevel%