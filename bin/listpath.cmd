@rem https://stackoverflow.com/questions/4106207/parse-path-using-for-f-in-bat-script
@echo off
if /i (%echoval%) EQU (on) @echo on

setlocal

@rem Print Path as a List

@rem don't verify environment as we want to see it as is
@rem

set temppath=
set temppath2=
set processpath=%path%
set errmsg=[doesn't exist]

if /i (%1) EQU (/g) goto global
if /i (%1) EQU (-g) goto global
if /i (%1) EQU (--global) goto global

@echo PATH
rem strip quotes to normalize using string manipulation
set temppath2=%processpath:"=%
rem add quotes now we know we aren't going to double up on already quoted strings
set temppath="%temppath2:;=";"%"
@rem echo %temppath2%
@rem echo. suppresses 'ECHO is off.' when string is empty
@rem %%~a strips quotes from the output
for %%a in (%temppath%) do (
  if exist %%~a\nul (
    echo.%%~a
  ) else (
    echo.%errmsg% %%~a 
  )
)
goto :display_lib_path
:global
@echo.
@echo PATH
rem strip quotes to normalize using string manipulation
set temppath2=%_global_path:"=%
rem add quotes now we know we aren't going to double up on already quoted strings
set temppath="%temppath2:;=";"%"
@rem echo %temppath2%
@rem echo. suppresses 'ECHO is off.' when string is empty
@rem %%~a strips quotes from the output
for %%a in (%temppath%) do (
  if exist %%~a\nul (
    echo.%%~a
  ) else (
    echo.%%~a %errmsg%
  )
)
goto :eof
:display_lib_path
if not defined LIB goto display_inc_path
@echo.
@echo LIB Path
rem strip quotes to normalize using string manipulation
set temppath2=%LIB:"=%
rem add quotes now we know we aren't going to double up on already quoted strings
set temppath="%temppath2:;=";"%"
@rem echo %temppath2%
@rem echo. suppresses 'ECHO is off.' when string is empty
@rem %%~a strips quotes from the output
for %%a in (%temppath%) do (
  if exist %%~a\nul (
    echo.%%~a
  ) else (
    echo.%%~a %errmsg%
  )
)
:display_inc_path
if not defined INCLUDE goto :eof
@echo.
@echo INCLUDE Path
rem strip quotes to normalize using string manipulation
set temppath2=%INCLUDE:"=%
rem add quotes now we know we aren't going to double up on already quoted strings
set temppath="%temppath2:;=";"%"
@rem echo %temppath2%
@rem echo. suppresses 'ECHO is off.' when string is empty
@rem %%~a strips quotes from the output
for %%a in (%temppath%) do (
  if exist %%~a\nul (
    echo.%%~a
  ) else (
    echo.%%~a %errmsg%
  )
)
@rem -----------------------------------------------------------------------
@rem
@rem  <|:) Wizard
@rem
@rem -----------------------------------------------------------------------
